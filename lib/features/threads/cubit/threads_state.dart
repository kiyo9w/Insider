import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insider/core/bloc_core/ui_status.dart';
import 'package:rest_client/rest_client.dart';

part 'threads_state.freezed.dart';

@freezed
abstract class ThreadsState with _$ThreadsState {
  const factory ThreadsState({
    @Default(UIStatus.initial()) UIStatus status,
    @Default([]) List<ChatSnapshot> threads,
    @Default([]) List<ChatSnapshot> filteredThreads,
    @Default('') String searchQuery,
    String? errorMessage,
  }) = _ThreadsState;
}
