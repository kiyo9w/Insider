import 'dart:async';
import 'dart:convert';

import 'package:eventflux/eventflux.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/configs/app_config.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/data/repositories/chat/chat_repository.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';

import 'package:insider/injector/injector.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:rest_client/rest_client.dart' as rc;
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl({
    required rc.WorkflowClient workflowClient,
  }) : _workflowClient = workflowClient;

  final rc.WorkflowClient _workflowClient;

  @override
  Stream<ChatStreamEvent> streamChat(ChatRequest request) {
    // Use unified chat completions endpoint for Simple QA
    return _handleStream(
      () => _workflowClient.chatCompletions(_mapRequest(request)),
      path: '/api/v1/chat/completions',
      request: request,
    );
  }

  @override
  Stream<ChatStreamEvent> streamDeepQa(ChatRequest request) {
    // Use unified chat completions endpoint for Deep QA
    return _handleStream(
      () => _workflowClient.chatCompletions(_mapRequest(request)),
      path: '/api/v1/chat/completions',
      request: request,
    );
  }

  @override
  Stream<ChatStreamEvent> streamProSearch(ChatRequest request) {
    return _handleStream(
      () => _workflowClient.chatCompletions(_mapRequest(request)),
      path: '/api/v1/chat/completions',
      request: request,
    );
  }

  @override
  Stream<ChatStreamEvent> chatCompletions(ChatRequest request) {
    return _handleStream(
      () => _workflowClient.chatCompletions(_mapRequest(request)),
      path: '/api/v1/chat/completions',
      request: request,
    );
  }

  @override
  Future<List<rc.ChatSnapshot>> getChatHistory({
    int limit = 50,
    int offset = 0,
  }) async {
    final response = await _workflowClient.getChatHistory(
      limit: limit,
      offset: offset,
    );
    return response.snapshots;
  }

  @override
  Future<rc.ChatHistoryResponse> getChatHistoryDetail(String historyId) {
    return _workflowClient.getChatHistoryDetail(historyId);
  }

  @override
  Future<void> deleteChatHistory(String historyId) {
    return _workflowClient.deleteChatHistory(historyId);
  }

  Stream<ChatStreamEvent> _handleStream(
    Future<HttpResponse<dynamic>> Function() call, {
    required String path,
    required ChatRequest request,
  }) {
    final controller = StreamController<ChatStreamEvent>();
    final eventQueue = <String>[];
    Timer? processTimer;
    StreamSubscription? upstreamSubscription;
    bool isCancelled = false;

    void processQueue(Timer timer) {
      if (isCancelled || controller.isClosed) {
        timer.cancel();
        return;
      }

      if (eventQueue.isNotEmpty) {
        final data = eventQueue.removeAt(0);

        // Check for various done markers
        final trimmedData = data.trim();
        if (trimmedData == '[DONE]' ||
            trimmedData == 'data: [DONE]' ||
            trimmedData.isEmpty) {
          // Skip empty data, handle [DONE]
          if (trimmedData == '[DONE]' || trimmedData == 'data: [DONE]') {
            controller.add(const ChatStreamEvent.done());
            processTimer?.cancel();
            controller.close();
          }
          return;
        }

        try {
          final json = jsonDecode(data) as Map<String, dynamic>;
          final transformed = _transformApiResponse(json);
          if (transformed != null) {
            // Check for stream done signal
            if (transformed['_stream_done'] == true) {
              controller.add(const ChatStreamEvent.done());
              processTimer?.cancel();
              controller.close();
              return;
            }
            if (!controller.isClosed) {
              controller.add(ChatStreamEvent.data(transformed));
            }
          }
        } catch (e) {
          // Could be malformed JSON or [DONE] marker - check again
          if (data.contains('[DONE]')) {
            controller.add(const ChatStreamEvent.done());
            processTimer?.cancel();
            controller.close();
            return;
          }
          if (!controller.isClosed) {
            controller.add(ChatStreamEvent.error('Parse error: $e'));
          }
        }
      }
    }

    processTimer =
        Timer.periodic(const Duration(milliseconds: 10), processQueue);

    // Map to rest_client ChatRequest to ensure proper serialization (includes provider field)
    final mappedRequest = _mapRequest(request);

    // Connect using EventFlux
    debugPrint('[SSE] Connecting to $path');
    debugPrint('[SSE] Request Body: ${jsonEncode(mappedRequest.toJson())}');

    final connectionFuture = _connectEventFlux(
      path: path,
      body: mappedRequest.toJson(),
      onData: (data) {
        if (!isCancelled && !controller.isClosed) {
          final decoded = data.replaceAllMapped(
            RegExp(r'\\u([0-9a-fA-F]{4})'),
            (match) =>
                String.fromCharCode(int.parse(match.group(1)!, radix: 16)),
          );
          debugPrint('[SSE] Received Event: $decoded');
          eventQueue.add(data);
        }
      },
      onError: (e) {
        if (e is EventFluxException) {
          debugPrint('[SSE] Error: ${e.message}');
        } else {
          debugPrint('[SSE] Error: $e');
        }
        if (!isCancelled && !controller.isClosed) {
          String errorMessage = e.toString();
          if (e is EventFluxException) {
            final rawMessage = e.message ?? e.toString();
            if (rawMessage.contains('429')) {
              errorMessage = 'Server is busy, please try again later.';
            } else if (rawMessage.contains('500')) {
              errorMessage = 'Server error, please try again later.';
            } else if (rawMessage.contains('401')) {
              errorMessage = 'Session expired, please login again.';
            } else {
              errorMessage = 'Connection error, please check your network.';
            }
          }
          controller.add(ChatStreamEvent.error('Stream error: $errorMessage'));
        }
      },
      onDone: () {
        debugPrint('[SSE] Connection closed');
        // Connection closed - wait for queue to drain
        // The [DONE] event in the queue will handle proper closure
        // Only force close if queue is empty and no [DONE] was received
        Future.delayed(const Duration(milliseconds: 500), () {
          if (eventQueue.isEmpty && !controller.isClosed && !isCancelled) {
            // No [DONE] event received, emit done and close
            debugPrint(
                '[SSE] Force closing controller (empty queue, no [DONE])');
            controller.add(const ChatStreamEvent.done());
            processTimer?.cancel();
            controller.close();
          }
        });
      },
      onSubscription: (subscription) {
        upstreamSubscription = subscription;
      },
    );

    controller.onCancel = () {
      debugPrint('[SSE] Controller cancelled');
      isCancelled = true;
      processTimer?.cancel();
      upstreamSubscription?.cancel();
    };

    return controller.stream;
  }

  Future<void> _connectEventFlux({
    required String path,
    required Map<String, dynamic> body,
    required Function(String) onData,
    required Function(dynamic) onError,
    required Function() onDone,
    Function(StreamSubscription)? onSubscription,
  }) async {
    final storage = Injector.instance<LocalStorageService>();
    final token = await storage.getString(key: AppKeys.accessTokenKey);

    // Construct full URL since EventFlux might need it (or relative if we use base)
    // Assuming AppConfig.baseUrl has the host.
    final url = '${AppConfig.baseUrl}$path';

    EventFlux.instance.connect(
      EventFluxConnectionType.post,
      url,
      header: {
        'Content-Type': 'application/json',
        'Accept': 'text/event-stream',
        if (token != null) 'Authorization': 'Bearer $token',
        if (token != null) 'cookie': 'sessionid=$token',
      },
      body: body,
      onSuccessCallback: (EventFluxResponse? response) {
        final subscription = response?.stream?.listen(
          (data) {
            // data.data is the raw string
            onData(data.data);
          },
          onError: (e) {
            onError(e);
          },
          onDone: () {
            onDone();
          },
        );

        if (subscription != null && onSubscription != null) {
          onSubscription(subscription);
        }
      },
      onError: (e) {
        onError(e);
      },
    );
  }

  Map<String, dynamic>? _transformApiResponse(Map<String, dynamic> json) {
    final event = json['event'] as String?;
    final data = json['data'] as Map<String, dynamic>?;

    if (data == null) return null;

    switch (event) {
      case 'text-chunk':
      case 'StreamEvent.TEXT_CHUNK':
        final text = data['text'] as String?;
        if (text != null && text.isNotEmpty) {
          return {'content': text};
        }
        return null;
      case 'related-queries':
      case 'StreamEvent.RELATED_QUERIES':
        final queries = data['related_queries'] as List?;
        if (queries != null && queries.isNotEmpty) {
          return {'related_queries': queries};
        }
        return null;
      case 'search-results':
      case 'StreamEvent.SEARCH_RESULTS':
        final resultsJson = data['results'] as List?;
        final images = (data['images'] as List?)?.cast<String>();

        if (resultsJson == null || resultsJson.isEmpty) {
          // Even if no results, we might have images
          if (images != null && images.isNotEmpty) {
            return {
              'event_type': 'search-results',
              'images': images,
            };
          }
          return null;
        }

        final results = resultsJson
            .whereType<Map<String, dynamic>>()
            .map(
              (e) => SearchResult(
                title: (e['title'] ?? '').toString(),
                url: (e['url'] ?? '').toString(),
                content: (e['content'] ?? '').toString(),
              ),
            )
            .where((r) => r.url.isNotEmpty)
            .toList();

        if (results.isEmpty) {
          if (images != null && images.isNotEmpty) {
            return {
              'event_type': 'search-results',
              'images': images,
            };
          }
          return null;
        }

        return {
          'sources': results.map(_toSourcePayload).toList(),
          'event_type': 'search-results',
          'agent_response': {
            'event_type': 'search-results',
            'step_number': 0,
            'steps_details': [
              {
                'step_number': 0,
                'step': 'Searching',
                'results': resultsJson,
                'status': 'completed',
              }
            ]
          },
          if (images != null && images.isNotEmpty) 'images': images,
        };
      case 'agent-call-tool':
      case 'StreamEvent.AGENT_CALL_TOOL':
        return {
          'agent_response': {
            'event_type': 'agent-call-tool',
            'steps_details': [
              {
                'step_number': 0,
                'step': 'Processing',
                'status': 'current',
              }
            ]
          }
        };
      case 'begin-stream':
      case 'StreamEvent.BEGIN_STREAM':
        return {'response_started': true};
      case 'stream-end':
      case 'StreamEvent.STREAM_END':
        // Signal stream completion
        return {'_stream_done': true};
      // Handle deep_qa agent events
      case 'agent-query-plan':
      case 'StreamEvent.AGENT_QUERY_PLAN':
        final steps = data['steps'] as List?;
        if (steps != null && steps.isNotEmpty) {
          return {
            'agent_response': {
              'event_type': 'agent-query-plan',
              'steps': steps,
            },
          };
        }
        return null;
      case 'agent-plan-delta':
      case 'StreamEvent.AGENT_PLAN_DELTA':
        final steps = data['steps'] as List?;
        if (steps != null && steps.isNotEmpty) {
          return {
            'agent_response': {
              'event_type': 'agent-plan-delta',
              'steps': steps,
            },
          };
        }
        return null;
      case 'agent-search-queries':
      case 'StreamEvent.AGENT_SEARCH_QUERIES':
        final queries = data['queries'] as List?;
        final stepNumber = data['step_number'] as int?;
        if (queries != null && queries.isNotEmpty) {
          return {
            'agent_response': {
              'event_type': 'agent-search-queries',
              'step_number': stepNumber,
              'queries': queries,
              'steps_details': [
                {
                  'step_number': stepNumber ?? 0,
                  'step': 'Searching',
                  'queries': queries,
                  'status': 'current',
                },
              ],
            },
          };
        }
        return null;
      case 'agent-read-results':
      case 'StreamEvent.AGENT_READ_RESULTS':
        final resultsJson = data['results'] as List?;
        final stepNumber = data['step_number'] as int?;
        final images = (data['images'] as List?)?.cast<String>();

        debugPrint(
            '[SSE Transform] agent-read-results: images=${images?.length ?? 0}');
        if (images != null && images.isNotEmpty) {
          debugPrint('[SSE Transform] Images found: $images');
        }

        if (resultsJson != null && resultsJson.isNotEmpty) {
          final results = resultsJson
              .whereType<Map<String, dynamic>>()
              .map(
                (e) => SearchResult(
                  title: (e['title'] ?? '').toString(),
                  url: (e['url'] ?? '').toString(),
                  content: (e['content'] ?? '').toString(),
                ),
              )
              .where((r) => r.url.isNotEmpty)
              .toList();

          return {
            'agent_response': {
              'event_type': 'agent-read-results',
              'step_number': stepNumber,
              'steps_details': [
                {
                  'step_number': stepNumber ?? 0,
                  'step': 'Reading',
                  'results': resultsJson,
                  'images': images,
                  'status': 'current',
                },
              ],
            },
            // Also emit sources for citation support
            if (results.isNotEmpty)
              'sources': results.map(_toSourcePayload).toList(),
            // Emit images separately for UI
            if (images != null && images.isNotEmpty) 'images': images,
          };
        }
        return null;
      case 'agent-understand-results':
      case 'StreamEvent.AGENT_UNDERSTAND_RESULTS':
        final text = data['text'] as String?;
        final stepNumber = data['step_number'] as int?;
        if (text != null && text.isNotEmpty) {
          return {
            'agent_response': {
              'event_type': 'agent-understand-results',
              'step_number': stepNumber,
              'thought':
                  text, // Pass thought directly for easier handling or inside steps_details
              'steps_details': [
                {
                  'step_number': stepNumber ?? 0,
                  // The step name might be needed for the model mapping if we were using it,
                  // but here we are constructing a raw map for the Cubit/UI.
                  'step': 'Thinking',
                  'status': 'current',
                  'thought': text,
                },
              ],
            },
          };
        }
        return null;
      case 'agent-finish':
      case 'StreamEvent.AGENT_FINISH':
        return {
          'agent_response': {
            'event_type': 'agent-finish',
          },
        };
      case 'final-response':
      case 'StreamEvent.FINAL_RESPONSE':
        // final-response contains the complete message, but we already
        // streamed it via text-chunk, so we can skip it
        return null;
      default:
        return data;
    }
  }

  Map<String, dynamic> _toSourcePayload(SearchResult result) {
    final title = result.title.trim();
    final url = result.url.trim();
    final content = result.content.trim();

    final sourceName = _sourceNameFromUrl(url);

    return {
      'title': title.isNotEmpty ? title : sourceName,
      'url': url,
      if (content.isNotEmpty) 'snippet': content,
      'content': content,
      'source': sourceName,
    };
  }

  String _sourceNameFromUrl(String url) {
    if (url.startsWith('rag://dataset/')) {
      return 'Dataset';
    }

    try {
      final uri = Uri.parse(url);
      if (uri.host.isNotEmpty) {
        return uri.host;
      }
    } catch (_) {
      // ignore parse errors
    }

    return url;
  }

  rc.ChatRequest _mapRequest(ChatRequest request) {
    return rc.ChatRequest(
      messages: request.messages.map(_mapChatMessage).toList(),
      conversationId: request.conversationId,
      threadId: request.threadId,
      workflowConfig: _mapWorkflowConfig(request.workflowConfig),
      reportStyle: _mapReportStyle(request.reportStyle),
      intraInfoConfig: _mapIntraInfoConfig(request.intraInfoConfig),
      extraInfoConfig: _mapExtraInfoConfig(request.extraInfoConfig),
      mode: _mapChatMode(request.mode),
      provider: request.mode == ChatMode.proSearch ? 'perplexity' : null,
    );
  }

  rc.ChatMode? _mapChatMode(ChatMode? mode) {
    if (mode == null) return null;
    switch (mode) {
      case ChatMode.simpleQa:
        return rc.ChatMode.simpleQa;
      case ChatMode.deepQa:
        return rc.ChatMode.deepQa;
      case ChatMode.proSearch:
        return rc.ChatMode.provider;
    }
  }

  rc.ChatMessage _mapChatMessage(ChatMessage message) {
    return rc.ChatMessage(
      content: message.content,
      role: _mapMessageRole(message.role),
      relatedQueries: message.relatedQueries,
      sources: message.sources?.map(_mapSearchResult).toList(),
      images: message.images,
      isErrorMessage: message.isErrorMessage,
      agentResponse: message.agentResponse != null
          ? _mapAgentResponse(message.agentResponse!)
          : null,
    );
  }

  rc.MessageRole _mapMessageRole(MessageRole role) {
    switch (role) {
      case MessageRole.user:
        return rc.MessageRole.user;
      case MessageRole.assistant:
        return rc.MessageRole.assistant;
    }
  }

  rc.SearchResult _mapSearchResult(SearchResult result) {
    return rc.SearchResult(
      title: result.title,
      url: result.url,
      content: result.content,
    );
  }

  rc.AgentSearchFullResponse _mapAgentResponse(
      AgentSearchFullResponse response) {
    return rc.AgentSearchFullResponse(
      steps: response.steps,
      stepsDetails: response.stepsDetails.map(_mapAgentSearchStep).toList(),
    );
  }

  rc.AgentSearchStep _mapAgentSearchStep(AgentSearchStep step) {
    return rc.AgentSearchStep(
      stepNumber: step.stepNumber,
      step: step.step,
      queries: step.queries,
      results: step.results?.map(_mapSearchResult).toList(),
      status: _mapAgentStepStatus(step.status),
    );
  }

  rc.AgentSearchStepStatus _mapAgentStepStatus(String status) {
    switch (status) {
      case 'done':
        return rc.AgentSearchStepStatus.done;
      case 'current':
        return rc.AgentSearchStepStatus.current;
      default:
        return rc.AgentSearchStepStatus.defaultValue;
    }
  }

  rc.WorkflowConfig? _mapWorkflowConfig(WorkflowConfig? config) {
    if (config == null) return null;
    return rc.WorkflowConfig(
      debug: config.debug,
      maxPlanIterations: config.maxPlanIterations,
      maxStepNum: config.maxStepNum,
      autoAcceptedPlan: config.autoAcceptedPlan,
      enableBackgroundInvestigation: config.enableBackgroundInvestigation,
    );
  }

  rc.ReportStyle? _mapReportStyle(ReportStyle? style) {
    if (style == null) return null;
    switch (style) {
      case ReportStyle.academic:
        return rc.ReportStyle.academic;
      case ReportStyle.popularScience:
        return rc.ReportStyle.popularScience;
      case ReportStyle.news:
        return rc.ReportStyle.news;
      case ReportStyle.socialMedia:
        return rc.ReportStyle.socialMedia;
      case ReportStyle.strategicInvestment:
        return rc.ReportStyle.strategicInvestment;
    }
  }

  rc.IntraInfoConfig? _mapIntraInfoConfig(IntraInfoConfig? config) {
    if (config == null) return null;
    return rc.IntraInfoConfig(
      enabled: config.enabled,
      maxResults: config.maxResults,
      resources: config.resources.map(_mapResource).toList(),
    );
  }

  rc.ExtraInfoConfig? _mapExtraInfoConfig(ExtraInfoConfig? config) {
    if (config == null) return null;
    return rc.ExtraInfoConfig(
      enabled: config.enabled,
      maxResults: config.maxResults,
      resources: config.resources.map(_mapResource).toList(),
    );
  }

  rc.Resource _mapResource(Resource resource) {
    return rc.Resource(
      uri: resource.uri,
      title: resource.title,
      description: resource.description ?? '',
    );
  }
}
