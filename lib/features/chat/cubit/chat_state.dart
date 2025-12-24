import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default('') String currentResponse,
    @Default(false) bool responseStarted,
    @Default(false) bool isSearching,
    @Default([]) List<String> searchQueries,
    @Default(false) bool isReading,
    @Default(0) int readingCount,
    @Default(0) int sourcesCount,
    @Default([]) List<String> relatedQuestions,
    String? error,
  }) = _ChatState;
}
