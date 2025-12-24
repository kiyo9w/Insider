import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/data/repositories/chat/chat_repository.dart';
import 'package:insider/features/chat/cubit/chat_state.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(const ChatState());

  final ChatRepository _chatRepository;
  StreamSubscription? _streamSubscription;

  void startConversation(String query) {
    emit(const ChatState()); // Reset state

    final request = ChatRequest(
      messages: [
        ChatMessage(
          content: query,
          role: MessageRole.user,
        ),
      ],
      conversationId: 'conv_${DateTime.now().millisecondsSinceEpoch}',
      threadId: 'thread_${DateTime.now().millisecondsSinceEpoch}',
      // Let backend decide workflow constraints
    );

    _streamSubscription?.cancel();
    _streamSubscription = _chatRepository.streamChat(request).listen(
      (event) {
        if (event is DataEvent) {
          _handleStreamData(event.data);
        } else if (event is ErrorEvent) {
          emit(state.copyWith(error: event.message));
        } else if (event is DoneEvent) {
          emit(state.copyWith(isSearching: false, isReading: false));
        }
      },
      onError: (error) {
        emit(state.copyWith(error: error.toString()));
      },
    );
  }

  void _handleStreamData(Map<String, dynamic> data) {
    if (data.containsKey('agent_response')) {
      final agentResponse = data['agent_response'] as Map<String, dynamic>?;
      if (agentResponse != null) {
        _handleAgentResponse(agentResponse);
      }
    }

    if (data.containsKey('content')) {
      final content = data['content'] as String?;
      if (content != null && content.isNotEmpty) {
        emit(state.copyWith(
          currentResponse: state.currentResponse + content,
          responseStarted: true,
          isSearching: false,
          isReading: false,
        ));
      }
    }

    if (data.containsKey('sources')) {
      final sources = data['sources'] as List?;
      if (sources != null) {
        emit(state.copyWith(sourcesCount: sources.length));
      }
    }

    if (data.containsKey('related_queries')) {
      final queries = data['related_queries'] as List?;
      if (queries != null && queries.isNotEmpty) {
        emit(state.copyWith(relatedQuestions: queries.cast<String>()));
      }
    }
  }

  void _handleAgentResponse(Map<String, dynamic> agentResponse) {
    final stepsDetails = agentResponse['steps_details'] as List?;
    if (stepsDetails != null && stepsDetails.isNotEmpty) {
      final latestStep = stepsDetails.last as Map<String, dynamic>;
      final status = latestStep['status'] as String?;

      if (status == 'current') {
        final queries = latestStep['queries'] as List?;
        final results = latestStep['results'] as List?;

        if (queries != null && queries.isNotEmpty) {
          emit(state.copyWith(
            isSearching: true,
            isReading: false,
            searchQueries: queries.cast<String>(),
          ));
        }

        if (results != null && results.isNotEmpty) {
          emit(state.copyWith(
            isSearching: false,
            isReading: true,
            readingCount: results.length,
          ));
        }
      }
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
