import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'news_state.freezed.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<ArticleListItem> articles,
    @Default([]) List<TopicItem> categories,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    String? error,
    String? selectedCategoryId,
  }) = _NewsState;
}
