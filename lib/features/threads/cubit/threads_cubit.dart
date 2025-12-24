import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/bloc_core/ui_status.dart';
import 'package:insider/data/repositories/chat/chat_repository.dart';
import 'package:insider/features/threads/cubit/threads_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThreadsCubit extends Cubit<ThreadsState> {
  ThreadsCubit(this._chatRepository) : super(const ThreadsState());

  final ChatRepository _chatRepository;

  Future<void> getThreads() async {
    emit(state.copyWith(status: const UIStatus.loading()));
    try {
      final history = await _chatRepository.getChatHistory();
      emit(state.copyWith(
        status: const UIStatus.loadSuccess(),
        threads: history,
        filteredThreads: history,
        searchQuery: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: UIStatus.loadFailed(message: e.toString()),
        errorMessage: e.toString(),
      ));
    }
  }

  void searchThreads(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(
        filteredThreads: state.threads,
        searchQuery: query,
      ));
      return;
    }

    final lowercaseQuery = query.toLowerCase();
    final filtered = state.threads.where((thread) {
      return thread.title.toLowerCase().contains(lowercaseQuery) ||
          thread.preview.toLowerCase().contains(lowercaseQuery);
    }).toList();

    emit(state.copyWith(
      filteredThreads: filtered,
      searchQuery: query,
    ));
  }
}
