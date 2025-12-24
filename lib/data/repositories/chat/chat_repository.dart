import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:rest_client/rest_client.dart' as rc;

abstract class ChatRepository {
  /// Simple QA workflow - fast question answering
  Stream<ChatStreamEvent> streamChat(ChatRequest request);

  /// Deep QA workflow - deep research and analysis
  Stream<ChatStreamEvent> streamDeepQa(ChatRequest request);

  /// Pro Search workflow - advanced reasoning with Perplexity
  Stream<ChatStreamEvent> streamProSearch(ChatRequest request);

  /// Unified chat endpoint - routes based on mode parameter in request
  Stream<ChatStreamEvent> chatCompletions(ChatRequest request);

  /// Fetch conversation history
  Future<List<rc.ChatSnapshot>> getChatHistory(
      {int limit = 50, int offset = 0});

  /// Fetch conversation details
  Future<rc.ChatHistoryResponse> getChatHistoryDetail(String historyId);

  /// Delete conversation history
  Future<void> deleteChatHistory(String historyId);
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
