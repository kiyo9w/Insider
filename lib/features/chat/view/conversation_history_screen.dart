import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rest_client/rest_client.dart' as rc;
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/data/source_service.dart';
import 'package:insider/features/chat/view/conversation_message.dart';
import 'package:insider/features/chat/view/widgets/assistant_message.dart';
import 'package:insider/features/chat/view/widgets/conversation_input.dart';
import 'package:insider/features/chat/view/widgets/source_selector_sheet.dart';
import 'package:insider/features/chat/view/widgets/sources_bottom_sheet.dart';
import 'package:insider/features/chat/view/widgets/user_message.dart';
import 'package:insider/data/repositories/chat/chat_repository.dart';
import 'package:insider/injector/injector.dart';
import 'package:uuid/uuid.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/widgets/app_toast.dart';

class ConversationHistoryScreen extends StatefulWidget {
  final String historyId;
  final String? title;

  const ConversationHistoryScreen({
    super.key,
    required this.historyId,
    this.title,
  });

  @override
  State<ConversationHistoryScreen> createState() =>
      _ConversationHistoryScreenState();
}

class _ConversationHistoryScreenState extends State<ConversationHistoryScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  bool _showScrollDownButton = false;
  bool _isSearching = false;
  bool _isReading = false;
  int _readingCount = 0;
  final List<String> _searchQueries = [];
  StreamSubscription? _streamSubscription;
  final SourceService _sourceService = SourceService.instance;
  late final ChatRepository _chatRepository;
  bool _showImagesView = false;
  bool _isLoadingHistory = true;

  // Track conversation history
  String _conversationId = '';
  String _threadId = '';
  final List<ChatMessage> _conversationHistory = [];

  // Message list for UI display
  final List<ConversationMessage> _messages = [];
  String? _currentStreamingMessageId;
  ChatMode _chatMode = ChatMode.simpleQa;

  // Agent step tracking for deep_qa mode
  List<AgentStep> _currentAgentSteps = [];
  List<String>? _currentQueryPlan;
  List<String> _currentImages = [];

  @override
  void initState() {
    super.initState();
    debugPrint(
        '[ConversationHistoryScreen] initState - historyId: ${widget.historyId}');
    _scrollController.addListener(_onScroll);
    _inputController.addListener(_onInputChanged);
    _chatRepository = Injector.instance<ChatRepository>();
    _sourceService.ensureRemoteResourcesLoaded().then((_) {
      if (mounted) setState(() {});
    });
    _loadHistory();
  }

  void _onInputChanged() {
    setState(() {
      // Update UI when input changes
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _inputController.dispose();
    _inputFocusNode.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final position = _scrollController.position;
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;
      final showButton = (maxScroll - currentScroll) > 100;
      if (showButton != _showScrollDownButton) {
        setState(() => _showScrollDownButton = showButton);
      }
    }
  }

  void _scrollToBottom({bool force = false}) {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;

    final isNearBottom = (maxScroll - currentScroll) < 100;

    if (force || isNearBottom) {
      _scrollController.animateTo(
        maxScroll,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _loadHistory() async {
    try {
      setState(() => _isLoadingHistory = true);

      final historyDetail =
          await _chatRepository.getChatHistoryDetail(widget.historyId);

      setState(() {
        _conversationId = historyDetail.id;
        _threadId = historyDetail.threadId;

        // Map history messages to UI model
        _messages.clear();
        _conversationHistory.clear();

        for (final msg in historyDetail.messages) {
          final isUser = msg.role == rc.MessageRole.user;
          final role = isUser ? MessageRole.user : MessageRole.assistant;

          // Map agent steps if available
          List<AgentStep>? agentSteps;
          final agentResponse = msg.agentResponse;
          if (agentResponse != null && agentResponse.stepsDetails != null) {
            agentSteps = agentResponse.stepsDetails!.map((step) {
              return AgentStep(
                stepNumber: step.stepNumber,
                title: step.step,
                queries: step.queries ?? [],
                results: step.results
                        ?.map((r) => AgentStepResult(
                              title: r.title,
                              url: r.url,
                              content: r.content,
                              favicon: r.url.isNotEmpty
                                  ? _getFaviconUrl(r.url)
                                  : null,
                            ))
                        .toList() ??
                    [],
                status: AgentStepStatus.done, // Assume history steps are done
                thought: step.thought,
              );
            }).toList();
          }

          // Add to backend history tracking
          _conversationHistory.add(ChatMessage(
            content: msg.content,
            role: role,
            relatedQueries: msg.relatedQueries,
            images: msg.images,
            sources: msg.sources
                ?.map((s) => SearchResult(
                      title: s.title,
                      url: s.url,
                      content: s.content,
                    ))
                .toList(),
            agentResponse: msg.agentResponse != null
                ? AgentSearchFullResponse(
                    steps: msg.agentResponse!.steps ?? [],
                    stepsDetails: msg.agentResponse!.stepsDetails
                            ?.map((s) => AgentSearchStep(
                                  stepNumber: s.stepNumber,
                                  step: s.step,
                                  queries: s.queries,
                                  results: s.results
                                      ?.map((r) => SearchResult(
                                            title: r.title,
                                            url: r.url,
                                            content: r.content,
                                          ))
                                      .toList(),
                                  status: s.status.name,
                                ))
                            .toList() ??
                        [],
                  )
                : null,
          ));

          // Aggregate sources from agent steps if main sources are empty
          var displaySources =
              msg.sources?.map((s) => s.toJson()).toList() ?? [];
          if (displaySources.isEmpty && agentSteps != null) {
            final allStepResults = agentSteps
                .expand((step) => step.results)
                .map((result) => {
                      'title': result.title,
                      'url': result.url,
                      'content': result.content,
                      'favicon': result.favicon,
                    })
                .toList();

            // Dedupe sources
            final existingUrls = <String>{};
            final dedupedSources = <Map<String, dynamic>>[];
            for (var source in allStepResults) {
              final url = source['url'] as String?;
              if (url != null &&
                  url.isNotEmpty &&
                  !existingUrls.contains(url)) {
                existingUrls.add(url);
                dedupedSources.add(source);
              }
            }
            displaySources = dedupedSources;
          }

          // Add to UI 'ConversationMessage'
          _messages.add(ConversationMessage(
            id: const Uuid().v4(),
            content: msg.content,
            role: role,
            images: msg.images ?? [],
            sources: displaySources,
            relatedQueries: msg.relatedQueries,
            sourcesCount: displaySources.length,
            agentSteps: agentSteps,
          ));
        }

        _isLoadingHistory = false;
      });

      // Scroll to bottom after loading
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom(force: true);
      });
    } catch (e) {
      debugPrint('Error loading history: $e');
      setState(() {
        _isLoadingHistory = false;
        _messages.add(ConversationMessage(
          id: 'error_loading',
          content: S.current.failed_to_load_history,
          role: MessageRole.assistant,
          isError: true,
        ));
      });
    }
  }

  void _sendMessage(String query) {
    if (_currentStreamingMessageId != null) return;

    final assistantMessageId =
        'msg_${DateTime.now().millisecondsSinceEpoch}_asst';
    _currentStreamingMessageId = assistantMessageId;

    _streamSubscription?.cancel();

    if (_messages.isNotEmpty) {
      for (int i = _messages.length - 1; i >= 0; i--) {
        if (_messages[i].role == MessageRole.assistant) {
          final msg = _messages[i];
          if (msg.relatedQueries != null && msg.relatedQueries!.isNotEmpty) {
            setState(() {
              _messages[i] = ConversationMessage(
                id: msg.id,
                content: msg.content,
                role: msg.role,
                isStreaming: msg.isStreaming,
                relatedQueries: null,
                sourcesCount: msg.sourcesCount,
                sources: msg.sources,
                agentSteps: msg.agentSteps,
                queryPlan: msg.queryPlan,
              );
            });
          }
          break;
        }
      }
    }

    if (_messages.isEmpty ||
        _messages.last.role != MessageRole.user ||
        _messages.last.content != query) {
      final userMessage = ChatMessage(
        content: query,
        role: MessageRole.user,
      );
      _conversationHistory.add(userMessage);

      setState(() {
        _messages.add(ConversationMessage(
          id: 'msg_${DateTime.now().millisecondsSinceEpoch}_user',
          content: query,
          role: MessageRole.user,
          images: const [],
        ));
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(force: true);
    });

    setState(() {
      _currentAgentSteps = [];
      _currentQueryPlan = null;
      _currentImages = [];

      _messages.add(ConversationMessage(
        id: assistantMessageId,
        content: '',
        role: MessageRole.assistant,
        isStreaming: true,
        sources: const [],
        sourcesCount: 0,
        images: const [],
      ));
      _isSearching = false;
      _isReading = false;
      _searchQueries.clear();
    });

    final request = ChatRequest(
      messages: List.from(_conversationHistory),
      conversationId: _conversationId,
      threadId: _threadId,
      mode: _chatMode,
      intraInfoConfig: IntraInfoConfig(
        enabled: _sourceService.selectedKnowledgeBaseUris.isNotEmpty,
        resources: _sourceService.knowledgeBaseResources
            .where(
                (r) => _sourceService.selectedKnowledgeBaseUris.contains(r.uri))
            .toList(),
      ),
      extraInfoConfig: ExtraInfoConfig(
        enabled: _sourceService.selectedWebUris.isNotEmpty,
        resources: _sourceService.webResources
            .where((r) => _sourceService.selectedWebUris.contains(r.uri))
            .toList(),
      ),
    );

    final Stream<ChatStreamEvent> stream;
    switch (_chatMode) {
      case ChatMode.deepQa:
        stream = _chatRepository.streamDeepQa(request);
        break;
      case ChatMode.proSearch:
        stream = _chatRepository.streamProSearch(request);
        break;
      case ChatMode.simpleQa:
        stream = _chatRepository.streamChat(request);
        break;
    }

    _streamSubscription = stream.listen(
      (event) {
        if (event is DataEvent) {
          _handleStreamData(event.data);
        } else if (event is ErrorEvent) {
          _handleStreamError(event.message);
        } else if (event is DoneEvent) {
          _handleStreamDone();
        }
      },
      onError: (error) {
        final errorStr = error.toString();
        if (errorStr.contains('Connection refused') ||
            errorStr.contains('connection error')) {
          if (_currentStreamingMessageId != null) {
            final messageIndex =
                _messages.indexWhere((m) => m.id == _currentStreamingMessageId);
            if (messageIndex != -1) {
              setState(() {
                _messages[messageIndex] = ConversationMessage(
                  id: _messages[messageIndex].id,
                  content: S.current.connection_failed,
                  role: _messages[messageIndex].role,
                  isStreaming: false,
                  isError: true,
                  images: _messages[messageIndex].images,
                );
                _currentStreamingMessageId = null;
              });
            }
          }
        } else {
          if (_currentStreamingMessageId != null) {
            final messageIndex =
                _messages.indexWhere((m) => m.id == _currentStreamingMessageId);
            if (messageIndex != -1) {
              setState(() {
                _messages[messageIndex] = ConversationMessage(
                  id: _messages[messageIndex].id,
                  content: error.toString(),
                  role: _messages[messageIndex].role,
                  isStreaming: false,
                  isError: true,
                  images: _messages[messageIndex].images,
                );
                _currentStreamingMessageId = null;
              });
            }
          }
        }
      },
      onDone: () {
        if (_currentStreamingMessageId != null && mounted) {
          _handleStreamDone();
        }
      },
    );
  }

  void _handleStreamData(Map<String, dynamic> data) {
    if (_currentStreamingMessageId == null) return;

    final messageIndex =
        _messages.indexWhere((m) => m.id == _currentStreamingMessageId);
    if (messageIndex == -1) return;

    if (data.containsKey('response_started')) {
      setState(() {
        _isSearching = false;
        _isReading = false;
      });
    }

    if (data.containsKey('agent_response')) {
      final agentResponse = data['agent_response'] as Map<String, dynamic>?;
      if (agentResponse != null) {
        _handleAgentResponse(agentResponse);
      }
    }

    if (data.containsKey('content')) {
      final content = data['content'] as String?;
      if (content != null && content.isNotEmpty) {
        setState(() {
          final currentMessage = _messages[messageIndex];
          _messages[messageIndex] = ConversationMessage(
            id: currentMessage.id,
            content: currentMessage.content + content,
            role: currentMessage.role,
            isStreaming: true,
            relatedQueries: currentMessage.relatedQueries,
            sourcesCount: currentMessage.sourcesCount,
            sources: currentMessage.sources,
            agentSteps: currentMessage.agentSteps,
            queryPlan: currentMessage.queryPlan,
            images: currentMessage.images,
          );
          _isSearching = false;
          _isReading = false;
        });
        _scrollToBottom();
      }
    }

    if (data.containsKey('sources')) {
      final sources = data['sources'] as List?;
      if (sources != null) {
        setState(() {
          final currentMessage = _messages[messageIndex];
          final mergedSources =
              _dedupeSources([...(currentMessage.sources ?? []), ...sources]);
          _messages[messageIndex] = ConversationMessage(
            id: currentMessage.id,
            content: currentMessage.content,
            role: currentMessage.role,
            isStreaming: currentMessage.isStreaming,
            relatedQueries: currentMessage.relatedQueries,
            sourcesCount: mergedSources.length,
            sources: mergedSources,
            agentSteps: currentMessage.agentSteps,
            queryPlan: currentMessage.queryPlan,
            images: currentMessage.images,
          );
        });
      }
    }

    if (data.containsKey('images')) {
      final images = data['images'] as List?;
      if (images != null) {
        setState(() {
          final currentMessage = _messages[messageIndex];
          final newImages = images.cast<String>();
          final mergedImages = [..._currentImages, ...newImages];
          _currentImages = mergedImages.toSet().toList();

          _messages[messageIndex] = ConversationMessage(
            id: currentMessage.id,
            content: currentMessage.content,
            role: currentMessage.role,
            isStreaming: currentMessage.isStreaming,
            relatedQueries: currentMessage.relatedQueries,
            sourcesCount: currentMessage.sourcesCount,
            sources: currentMessage.sources,
            agentSteps: currentMessage.agentSteps,
            queryPlan: currentMessage.queryPlan,
            images: List.from(_currentImages),
          );
        });
      }
    }

    if (data.containsKey('related_queries')) {
      final queries = data['related_queries'] as List?;
      if (queries != null && queries.isNotEmpty) {
        setState(() {
          final currentMessage = _messages[messageIndex];
          _messages[messageIndex] = ConversationMessage(
            id: currentMessage.id,
            content: currentMessage.content,
            role: currentMessage.role,
            isStreaming: currentMessage.isStreaming,
            relatedQueries: queries.cast<String>(),
            sourcesCount: currentMessage.sourcesCount,
            sources: currentMessage.sources,
            agentSteps: currentMessage.agentSteps,
            queryPlan: currentMessage.queryPlan,
            images: currentMessage.images,
          );
        });
      }
    }
  }

  void _handleAgentResponse(Map<String, dynamic> agentResponse) {
    if (_currentStreamingMessageId == null) return;

    final messageIndex =
        _messages.indexWhere((m) => m.id == _currentStreamingMessageId);
    if (messageIndex == -1) return;

    final eventType = agentResponse['event_type'] as String?;

    switch (eventType) {
      case 'agent-query-plan':
        final steps = agentResponse['steps'] as List?;
        if (steps != null && steps.isNotEmpty) {
          setState(() {
            _currentQueryPlan = steps.cast<String>();
            _currentAgentSteps = steps.asMap().entries.map((entry) {
              return AgentStep(
                stepNumber: entry.key,
                title: entry.value.toString(),
                status: entry.key == 0
                    ? AgentStepStatus.searching
                    : AgentStepStatus.pending,
              );
            }).toList();
            _updateMessageAgentSteps(messageIndex);
          });
        }
        break;

      case 'agent-plan-delta':
        final steps = agentResponse['steps'] as List?;
        if (steps != null && steps.isNotEmpty) {
          setState(() {
            final newSteps = steps.cast<String>();
            if (_currentQueryPlan == null) {
              _currentQueryPlan = newSteps;
            } else {
              _currentQueryPlan!.addAll(newSteps);
            }

            final startIdx = _currentAgentSteps.length;
            final newAgentSteps = newSteps.asMap().entries.map((entry) {
              return AgentStep(
                stepNumber: startIdx + entry.key,
                title: entry.value.toString(),
                status: AgentStepStatus.pending,
              );
            }).toList();

            _currentAgentSteps.addAll(newAgentSteps);
            _updateMessageAgentSteps(messageIndex);
          });
        }
        break;

      case 'agent-search-queries':
        final queries = agentResponse['queries'] as List?;
        final stepNumber = agentResponse['step_number'] as int? ?? 0;
        if (queries != null && queries.isNotEmpty) {
          setState(() {
            _isSearching = true;
            _isReading = false;
            _searchQueries.clear();
            _searchQueries.addAll(queries.cast<String>());

            _updateAgentStep(
              stepNumber,
              queries: queries.cast<String>(),
              status: AgentStepStatus.searching,
            );
            _updateMessageAgentSteps(messageIndex);
          });
        }
        break;

      case 'agent-read-results':
        final stepsDetails = agentResponse['steps_details'] as List?;
        final stepNumber = agentResponse['step_number'] as int? ?? 0;
        if (stepsDetails != null && stepsDetails.isNotEmpty) {
          final latestStep = stepsDetails.last as Map<String, dynamic>;
          final results = latestStep['results'] as List?;
          if (results != null && results.isNotEmpty) {
            setState(() {
              _isSearching = false;
              _isReading = true;

              List<AgentStepResult> existingResults = [];
              if (_currentAgentSteps.length > stepNumber) {
                existingResults = _currentAgentSteps[stepNumber].results;
              }

              final newStepResults = results.whereType<Map>().map((r) {
                final url = r['url']?.toString() ?? '';
                return AgentStepResult(
                  title: r['title']?.toString() ?? 'Source',
                  url: url,
                  content: r['content']?.toString(),
                  favicon: url.isNotEmpty ? _getFaviconUrl(url) : null,
                );
              }).toList();

              final Map<String, AgentStepResult> mergedMap = {};
              for (var result in existingResults) {
                mergedMap[result.url] = result;
              }
              for (var result in newStepResults) {
                mergedMap[result.url] = result;
              }
              final mergedResults = mergedMap.values.toList();

              _readingCount = mergedResults.length;

              _updateAgentStep(
                stepNumber,
                results: mergedResults,
                status: AgentStepStatus.reading,
              );
              _updateMessageAgentSteps(messageIndex);
            });
          }
        }
        break;

      case 'agent-understand-results':
        final thought = agentResponse['thought'] as String?;
        final stepNumber = agentResponse['step_number'] as int? ?? 0;
        if (thought != null && thought.isNotEmpty) {
          setState(() {
            String currentThought = '';
            if (_currentAgentSteps.length > stepNumber) {
              currentThought = _currentAgentSteps[stepNumber].thought ?? '';
            }

            _updateAgentStep(
              stepNumber,
              thought: currentThought + thought,
              status: AgentStepStatus.reading,
            );
            _updateMessageAgentSteps(messageIndex);
          });
        }
        break;

      case 'agent-finish':
        setState(() {
          _isSearching = false;
          _isReading = false;
          _currentAgentSteps = _currentAgentSteps.map((step) {
            return step.copyWith(status: AgentStepStatus.done);
          }).toList();
          _updateMessageAgentSteps(messageIndex);
        });
        break;

      case 'search-results':
        final stepsDetails = agentResponse['steps_details'] as List?;
        final stepNumber = agentResponse['step_number'] as int? ?? 0;
        if (stepsDetails != null && stepsDetails.isNotEmpty) {
          final latestStep = stepsDetails.last as Map<String, dynamic>;
          final results = latestStep['results'] as List?;
          if (results != null && results.isNotEmpty) {
            setState(() {
              _isSearching = false;
              _isReading = true;

              List<AgentStepResult> existingResults = [];
              if (_currentAgentSteps.length > stepNumber) {
                existingResults = _currentAgentSteps[stepNumber].results;
              }

              final newStepResults = results.whereType<Map>().map((r) {
                final url = r['url']?.toString() ?? '';
                return AgentStepResult(
                  title: r['title']?.toString() ?? 'Source',
                  url: url,
                  content: r['content']?.toString(),
                  favicon: url.isNotEmpty ? _getFaviconUrl(url) : null,
                );
              }).toList();

              final Map<String, AgentStepResult> mergedMap = {};
              for (var result in existingResults) {
                mergedMap[result.url] = result;
              }
              for (var result in newStepResults) {
                mergedMap[result.url] = result;
              }
              final mergedResults = mergedMap.values.toList();

              _readingCount = mergedResults.length;

              _updateAgentStep(
                stepNumber,
                results: mergedResults,
                status: AgentStepStatus.reading,
              );
              _updateMessageAgentSteps(messageIndex);
            });
          }
        }
        break;

      case 'agent-call-tool':
        final stepsDetails = agentResponse['steps_details'] as List?;
        final stepNumber = agentResponse['step_number'] as int? ?? 0;
        if (stepsDetails != null && stepsDetails.isNotEmpty) {
          final latestStep = stepsDetails.last as Map<String, dynamic>;
          final stepName = latestStep['step'] as String? ?? 'Processing';

          setState(() {
            _updateAgentStep(
              stepNumber,
              thought: stepName,
              status: AgentStepStatus.pending,
            );
            _updateMessageAgentSteps(messageIndex);
          });
        }
        break;

      default:
        final stepsDetails = agentResponse['steps_details'] as List?;
        if (stepsDetails != null && stepsDetails.isNotEmpty) {
          final latestStep = stepsDetails.last as Map<String, dynamic>;
          final status = latestStep['status'] as String?;

          if (status == 'current') {
            final queries = latestStep['queries'] as List?;
            final results = latestStep['results'] as List?;

            if (queries != null && queries.isNotEmpty) {
              setState(() {
                _isSearching = true;
                _isReading = false;
                _searchQueries.clear();
                _searchQueries.addAll(queries.cast<String>());
              });
            }

            if (results != null && results.isNotEmpty) {
              setState(() {
                _isSearching = false;
                _isReading = true;
                _readingCount = results.length;
              });
            }
          }
        }
    }
  }

  void _updateAgentStep(
    int stepNumber, {
    List<String>? queries,
    List<AgentStepResult>? results,
    AgentStepStatus? status,
    String? thought,
  }) {
    while (_currentAgentSteps.length <= stepNumber) {
      _currentAgentSteps.add(AgentStep(
        stepNumber: _currentAgentSteps.length,
        title: _currentQueryPlan != null &&
                _currentQueryPlan!.length > _currentAgentSteps.length
            ? _currentQueryPlan![_currentAgentSteps.length]
            : 'Step ${_currentAgentSteps.length + 1}',
      ));
    }

    final currentStep = _currentAgentSteps[stepNumber];
    _currentAgentSteps[stepNumber] = currentStep.copyWith(
      queries: queries ?? currentStep.queries,
      results: results ?? currentStep.results,
      status: status ?? currentStep.status,
      thought: thought ?? currentStep.thought,
    );

    for (int i = 0; i < stepNumber; i++) {
      if (_currentAgentSteps[i].status != AgentStepStatus.done) {
        _currentAgentSteps[i] = _currentAgentSteps[i].copyWith(
          status: AgentStepStatus.done,
        );
      }
    }
  }

  void _updateMessageAgentSteps(int messageIndex) {
    if (messageIndex < 0 || messageIndex >= _messages.length) return;

    final currentMessage = _messages[messageIndex];
    _messages[messageIndex] = ConversationMessage(
      id: currentMessage.id,
      content: currentMessage.content,
      role: currentMessage.role,
      isStreaming: currentMessage.isStreaming,
      relatedQueries: currentMessage.relatedQueries,
      sourcesCount: currentMessage.sourcesCount,
      sources: currentMessage.sources,
      agentSteps: List.from(_currentAgentSteps),
      queryPlan: _currentQueryPlan,
      images: currentMessage.images,
    );
  }

  String _getFaviconUrl(String url) {
    try {
      if (url.startsWith('rag://')) return '';
      final uri = Uri.parse(url);
      if (uri.scheme != 'http' && uri.scheme != 'https') return '';
      return 'https://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${Uri.encodeComponent(url)}&size=128';
    } catch (_) {
      return '';
    }
  }

  void _handleStreamError(String message) {
    if (_currentStreamingMessageId != null) {
      final messageIndex =
          _messages.indexWhere((m) => m.id == _currentStreamingMessageId);
      if (messageIndex != -1) {
        setState(() {
          _messages[messageIndex] = ConversationMessage(
            id: _messages[messageIndex].id,
            content: message.replaceFirst('Stream error: ', ''),
            role: _messages[messageIndex].role,
            isStreaming: false,
            isError: true,
          );
          _isSearching = false;
          _isReading = false;
          _currentStreamingMessageId = null;
        });
      }
    }
  }

  void _handleStreamDone() {
    if (_currentStreamingMessageId == null) return;

    final messageIndex =
        _messages.indexWhere((m) => m.id == _currentStreamingMessageId);
    if (messageIndex == -1) return;

    setState(() {
      _isSearching = false;
      _isReading = false;

      final currentMessage = _messages[messageIndex];
      _messages[messageIndex] = ConversationMessage(
        id: currentMessage.id,
        content: currentMessage.content,
        role: currentMessage.role,
        isStreaming: false,
        relatedQueries: currentMessage.relatedQueries,
        sourcesCount: currentMessage.sourcesCount,
        sources: currentMessage.sources,
        agentSteps: currentMessage.agentSteps,
        queryPlan: currentMessage.queryPlan,
        images: currentMessage.images,
      );

      if (currentMessage.content.isNotEmpty) {
        final assistantMessage = ChatMessage(
          content: currentMessage.content,
          role: MessageRole.assistant,
          relatedQueries: currentMessage.relatedQueries,
        );
        _conversationHistory.add(assistantMessage);
      }

      _currentStreamingMessageId = null;
    });
  }

  void _stopGeneration() {
    _streamSubscription?.cancel();

    setState(() {
      for (int i = 0; i < _messages.length; i++) {
        if (_messages[i].isStreaming) {
          final msg = _messages[i];
          _messages[i] = ConversationMessage(
            id: msg.id,
            content: msg.content,
            role: msg.role,
            isStreaming: false,
            relatedQueries: msg.relatedQueries,
            sourcesCount: msg.sourcesCount,
            sources: msg.sources,
            agentSteps: msg.agentSteps,
            queryPlan: msg.queryPlan,
            images: msg.images,
          );
        }
      }

      _currentStreamingMessageId = null;
      _isSearching = false;
      _isReading = false;
    });
  }

  void _handleSendMessage() {
    final query = _inputController.text.trim();
    if (query.isEmpty) return;

    HapticFeedback.mediumImpact();
    _inputController.clear();
    FocusScope.of(context).unfocus();
    _sendMessage(query);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(force: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        _inputFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor:
            isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _buildAppBar(context, isDark),
                  Expanded(
                    child: _isLoadingHistory
                        ? const Center(child: CircularProgressIndicator())
                        : _showImagesView
                            ? _buildImagesView(isDark)
                            : SingleChildScrollView(
                                controller: _scrollController,
                                padding: const EdgeInsets.only(bottom: 80),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ..._messages.map((message) =>
                                          _buildMessage(message, isDark)),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                  ),
                  if (!_showImagesView && !_isLoadingHistory)
                    ConversationInput(
                      isDark: isDark,
                      controller: _inputController,
                      focusNode: _inputFocusNode,
                      chatMode: _chatMode,
                      isStreaming: _currentStreamingMessageId != null,
                      hasCustomSelection: _sourceService.hasCustomSelection,
                      onSend: _handleSendMessage,
                      onStop: _stopGeneration,
                      onOpenSourceSelector: () {
                        HapticFeedback.lightImpact();
                        _openSourceSelector(isDark);
                      },
                      onAttach: () {
                        HapticFeedback.lightImpact();
                        showAppToast(
                          context,
                          message:
                              S.of(context).feature_coming_soon('Attachments'),
                        );
                      },
                      onChangeModel: () {},
                      onModeChanged: (mode) {
                        setState(() {
                          _chatMode = mode;
                        });
                      },
                    ),
                ],
              ),
              if (_showScrollDownButton && !_showImagesView)
                Positioned(
                  right: 16,
                  bottom: 100,
                  child: _buildScrollDownButton(isDark),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(
                color: isDark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.05),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sources',
                        style: DesignSystem.titleMedium.copyWith(
                          color: isDark
                              ? DesignSystem.textPrimaryDark
                              : DesignSystem.textPrimaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: isDark
                              ? DesignSystem.textSecondaryDark
                              : DesignSystem.textSecondaryLight,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAttachmentOption(
                        icon: Icons.image_outlined,
                        label: 'Image',
                        isDark: isDark,
                        onTap: () {},
                      ),
                      _buildAttachmentOption(
                        icon: Icons.camera_alt_outlined,
                        label: S.current.camera,
                        isDark: isDark,
                        onTap: () {},
                      ),
                      _buildAttachmentOption(
                        icon: Icons.description_outlined,
                        label: S.current.file,
                        isDark: isDark,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAttachmentOption({
    required IconData icon,
    required String label,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onTap();
        showAppToast(
          context,
          message: S.of(context).feature_coming_soon(label),
        );
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 32,
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: DesignSystem.bodySmall.copyWith(
              color: isDark
                  ? DesignSystem.textSecondaryDark
                  : DesignSystem.textSecondaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    final allImages = <String>[];
    for (final message in _messages) {
      if (message.images != null && message.images!.isNotEmpty) {
        allImages.addAll(message.images!);
      }
    }
    final hasImages = allImages.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? DesignSystem.backgroundDarkElevated
                    : DesignSystem.backgroundLightElevated,
              ),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              ),
            ),
          ),
          const SizedBox(width: 16),
          if (widget.title != null)
            Expanded(
              child: Text(
                '${widget.title!}',
                style: DesignSystem.titleMedium.copyWith(
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : DesignSystem.textPrimaryLight,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          if (widget.title == null) const Spacer(),
          if (widget.title != null) const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? DesignSystem.backgroundDarkElevated
                  : DesignSystem.backgroundLightElevated,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasImages) ...[
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      setState(() {
                        _showImagesView = !_showImagesView;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: _showImagesView
                          ? BoxDecoration(
                              color: DesignSystem.primaryCyan.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            )
                          : null,
                      child: Icon(
                        Icons.image_outlined,
                        size: 20,
                        color: _showImagesView
                            ? DesignSystem.primaryCyan
                            : (isDark
                                ? DesignSystem.iconDark
                                : DesignSystem.iconLight),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                // Icon(
                //   Icons.ios_share,
                //   size: 20,
                //   color:
                //       isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                // ),
                // const SizedBox(width: 16),
                // Icon(
                //   Icons.bookmark_outline,
                //   size: 20,
                //   color:
                //       isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                // ),
                // const SizedBox(width: 16),
                // Icon(
                //   Icons.more_horiz,
                //   size: 20,
                //   color:
                //       isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(ConversationMessage message, bool isDark) {
    final sourceCount = _sourceCountForMessage(message);

    if (message.role == MessageRole.user) {
      return UserMessage(
        message: message,
        isDark: isDark,
      );
    }

    return AssistantMessage(
      message: message,
      isDark: isDark,
      sourceCount: sourceCount,
      onSourcesTap: (filterIndices) {
        _showSourcesBottomSheet(
          context,
          message.sources,
          sourceCount,
          isDark,
          filterIndices: filterIndices,
        );
      },
      onRelatedQuestionTap: _sendMessage,
      isSearching: _isSearching,
      isReading: _isReading,
      readingCount: _readingCount,
      searchQueries: _searchQueries,
      onRetry: () => _handleRetry(message.id),
    );
  }

  void _handleRetry(String assistantMessageId) {
    final index = _messages.indexWhere((m) => m.id == assistantMessageId);
    if (index == -1) return;

    if (index > 0 && _messages[index - 1].role == MessageRole.user) {
      final userQuery = _messages[index - 1].content;

      setState(() {
        _messages.removeAt(index);
      });

      _sendMessage(userQuery);
    }
  }

  int _sourceCountForMessage(ConversationMessage message) {
    final listCount = message.sources?.length ?? 0;
    if (listCount > 0) return listCount;
    return message.sourcesCount ?? 0;
  }

  List<dynamic> _dedupeSources(List<dynamic> sources) {
    final Map<String, dynamic> seen = {};
    var fallbackIndex = 0;

    for (final source in sources) {
      String? url;

      if (source is Map) {
        url = source['url']?.toString();
      } else if (source is SearchResult) {
        url = source.url;
      }

      if (url != null && url.isNotEmpty) {
        if (url.endsWith('/')) {
          url = url.substring(0, url.length - 1);
        }
        seen[url] = source;
        continue;
      }

      seen['fallback_$fallbackIndex'] = source;
      fallbackIndex++;
    }

    return seen.values.toList();
  }

  void _showSourcesBottomSheet(
    BuildContext context,
    List<dynamic>? sources,
    int sourceCount,
    bool isDark, {
    List<int>? filterIndices,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SourcesBottomSheet(
        sources: sources,
        sourceCount: sourceCount,
        isDark: isDark,
        filterIndices: filterIndices,
      ),
    );
  }

  Widget _buildImagesView(bool isDark) {
    final allImages = <String>[];
    for (final message in _messages) {
      if (message.images != null && message.images!.isNotEmpty) {
        allImages.addAll(message.images!);
      }
    }

    if (allImages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 64,
              color: isDark ? Colors.grey[600] : Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No images yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[500] : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Images from the conversation will appear here',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey[600] : Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: allImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showFullImage(context, allImages[index], isDark);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              allImages[index],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: isDark
                      ? const Color(0xFF2C2C2C)
                      : const Color(0xFFF5F5F5),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: DesignSystem.primaryCyan,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: isDark
                      ? const Color(0xFF2C2C2C)
                      : const Color(0xFFF5F5F5),
                  child: Icon(
                    Icons.broken_image_outlined,
                    size: 48,
                    color: isDark ? Colors.grey[600] : Colors.grey[400],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showFullImage(BuildContext context, String imageUrl, bool isDark) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Center(
            child: InteractiveViewer(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollDownButton(bool isDark) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _scrollToBottom(force: true);
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark
              ? DesignSystem.backgroundDarkElevated
              : DesignSystem.backgroundLightElevated,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          CupertinoIcons.arrow_down,
          color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
          size: 24,
        ),
      ),
    );
  }

  Future<void> _openSourceSelector(bool isDark) async {
    await SourceSelectorSheet.show(
      context: context,
      isDark: isDark,
      webResources: _sourceService.webResources,
      knowledgeBaseResources: _sourceService.knowledgeBaseResources,
      selectedWebUris: _sourceService.selectedWebUris,
      selectedKnowledgeBaseUris: _sourceService.selectedKnowledgeBaseUris,
      sourceService: _sourceService,
      isWebEnabled: _sourceService.isWebEnabled,
      isKnowledgeBaseEnabled: _sourceService.isKnowledgeBaseEnabled,
    );

    if (mounted) setState(() {});
  }
}
