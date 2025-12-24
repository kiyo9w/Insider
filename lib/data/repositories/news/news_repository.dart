import 'package:rest_client/rest_client.dart';

abstract class NewsRepository {
  Future<ArticleListResponse> getNews(NewsArticlesFilterRequest request);
  Future<TopicListResponse> getCategories();
  Future<ArticleDetailResponse> getNewsDetail(String newsId);
}
