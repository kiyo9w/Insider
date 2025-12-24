import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/configs/app_config.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/data/source_service.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';

class ChatApiService {
  ChatApiService({
    String? baseUrl,
    Dio? dio,
  })  : baseUrl = baseUrl ?? AppConfig.baseUrl,
        _dio = dio ?? Dio();

  final String baseUrl;
  final Dio _dio;

  Stream<ChatStreamEvent> streamChat(ChatRequest request) async* {
    final url = '$baseUrl/api/v1/workflow/simple_qa/completions';

    // Get access token from local storage
    final localStorage = Injector.instance<LocalStorageService>();
    final String token =
        (await localStorage.getString(key: AppKeys.accessTokenKey)) ?? '';

    // Prepare request body as JSON object (not string)
    final bodyMap = request.toJson();

    // Prepare headers
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'text/event-stream',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    final controller = StreamController<ChatStreamEvent>.broadcast();

    try {
      final response = await _dio.postUri<ResponseBody>(
        Uri.parse(url),
        data: bodyMap,
        options: Options(
          headers: headers,
          responseType: ResponseType.stream,
          followRedirects: true,
          receiveDataWhenStatusError: true,
        ),
      );

      final stream = response.data?.stream;
      if (stream == null) {
        controller
            .add(const ChatStreamEvent.error('Empty response from server'));
        await controller.close();
      } else {
        stream
            .map((chunk) => chunk.toList())
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .listen((line) {
          final trimmed = line.trim();
          if (trimmed.isEmpty) return;

          // SSE lines usually start with "data:"
          final dataPrefix = 'data:';
          if (trimmed.startsWith(dataPrefix)) {
            final payload = trimmed.substring(dataPrefix.length).trim();

            if (kDebugMode) {
              // Log the raw SSE payload as-is (UTF-8 decoded) to preserve non-English text.
              debugPrint('[SSE][raw] $payload');
            }

            if (payload == '[DONE]') {
              controller.add(const ChatStreamEvent.done());
              controller.close();
              return;
            }

            try {
              final json = jsonDecode(payload) as Map<String, dynamic>;
              final transformedData = _transformApiResponse(json);
              if (transformedData != null) {
                controller.add(ChatStreamEvent.data(transformedData));

                if (kDebugMode) {
                  debugPrint('[SSE][data] $transformedData');
                }
              }
            } catch (e) {
              if (kDebugMode) {
                debugPrint('[SSE] Parse Error: $e');
                // Log full payload to aid debugging localized content.
                debugPrint('[SSE] Data: $payload');
              }
            }
          }
        }, onError: (error) {
          if (kDebugMode) {
            debugPrint('[SSE] Stream error: $error');
          }
          controller.add(ChatStreamEvent.error('Stream error: $error'));
          controller.close();
        }, onDone: () {
          if (kDebugMode) {
            debugPrint('[SSE] Stream done');
          }
          controller.add(const ChatStreamEvent.done());
          controller.close();
        }, cancelOnError: false);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('[SSE] Connection error: $e');
      }
      controller.add(ChatStreamEvent.error('Connection error: $e'));
      await controller.close();
    }

    // Yield events from the controller and handle cleanup
    await for (final event in controller.stream) {
      yield event;
    }
  }

  /// Transforms API response format to match conversation screen expectations
  /// API format: {"event": "text-chunk", "data": {"event_type": "text-chunk", "text": "..."}}
  /// Expected format: {"content": "...", "related_queries": [...], etc.}
  Map<String, dynamic>? _transformApiResponse(Map<String, dynamic> json) {
    final event = json['event'] as String?;
    final data = json['data'] as Map<String, dynamic>?;

    if (data == null) return null;

    // Handle different event types
    switch (event) {
      case 'text-chunk':
        // Extract text and map to content field
        final text = data['text'] as String?;
        if (text != null && text.isNotEmpty) {
          return {'content': text};
        }
        return null;

      case 'related-queries':
        // Extract related queries
        final queries = data['related_queries'] as List?;
        if (queries != null && queries.isNotEmpty) {
          return {'related_queries': queries};
        }
        return null;

      case 'search-results':
        final resultsJson = data['results'] as List?;
        if (resultsJson == null || resultsJson.isEmpty) return null;

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

        if (results.isEmpty) return null;

        // Keep source selector in sync with what backend actually searched
        SourceService.instance.ingestSearchResults(results);

        return {
          'sources': results.map(_toSourcePayload).toList(),
          'event_type': 'search-results',
        };

      case 'begin-stream':
        // Signal that response has started
        return {'response_started': true};

      case 'stream-end':
        // Stream is ending - this will be handled by onDone callback
        // Return null to skip this event
        return null;

      default:
        // For unknown events, return the data as-is
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
      // Preserve both fields; UI consumes snippet while retaining original content.
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
      // ignore parse errors and fall back to raw url
    }

    return url;
  }

  void dispose() {}
}

sealed class ChatStreamEvent {
  const ChatStreamEvent();

  const factory ChatStreamEvent.data(Map<String, dynamic> data) = DataEvent;
  const factory ChatStreamEvent.error(String message) = ErrorEvent;
  const factory ChatStreamEvent.done() = DoneEvent;
}

class DataEvent extends ChatStreamEvent {
  final Map<String, dynamic> data;
  const DataEvent(this.data);
}

class ErrorEvent extends ChatStreamEvent {
  final String message;
  const ErrorEvent(this.message);
}

class DoneEvent extends ChatStreamEvent {
  const DoneEvent();
}
