import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/data/repositories/news/news_repository.dart';
import 'package:insider/features/discovery/cubit/news_state.dart';
import 'package:rest_client/rest_client.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit({
    required NewsRepository newsRepository,
  })  : _newsRepository = newsRepository,
        super(const NewsState());

  final NewsRepository _newsRepository;
  int _currentPage = 0; // Added for pagination

  Future<void> loadCategories() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final response = await _newsRepository.getCategories();

      // items is List<TopicItem>
      final categories = response.items;

      emit(state.copyWith(
        categories: categories,
        selectedCategoryId: null, // Default to Top News
        isLoading: false,
      ));

      // Always load Top News initially
      loadArticles(categoryId: null, refresh: true);
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadArticles({
    String? categoryId,
    bool refresh = false,
    bool ignoreCurrentCategory = false,
  }) async {
    try {
      if (refresh) {
        _currentPage = 0; // Reset page on refresh
        emit(state.copyWith(isLoading: true, error: null, hasMore: true));
      } else {
        if (!state.hasMore) return; // Don't load if no more
        emit(state.copyWith(isLoadingMore: true, error: null));
      }

      final requestCategory = ignoreCurrentCategory
          ? categoryId
          : (categoryId ?? state.selectedCategoryId);

      final request = NewsArticlesFilterRequest(
        topic: requestCategory,
        page: refresh ? 1 : (_currentPage + 1),
        pageSize: 20,
      );

      final response = await _newsRepository.getNews(request);
      final articles = response.items;
      final hasMore = articles.length >= request.pageSize;

      if (refresh) {
        emit(state.copyWith(
          articles: articles,
          isLoading: false,
          selectedCategoryId: requestCategory,
          hasMore: hasMore,
        ));
      } else {
        emit(state.copyWith(
          articles: [...state.articles, ...articles],
          isLoadingMore: false,
          hasMore: hasMore,
        ));
      }

      // Increment current page only if articles were successfully loaded
      if (articles.isNotEmpty || refresh) {
        _currentPage = request.page;
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: e.toString(),
      ));
    }
  }

  void selectCategory(String? categoryId) {
    if (state.selectedCategoryId != categoryId) {
      loadArticles(
        categoryId: categoryId,
        refresh: true,
        ignoreCurrentCategory: true,
      );
    }
  }
}
