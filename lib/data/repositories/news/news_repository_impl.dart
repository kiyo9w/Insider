import 'package:insider/core/exceptions/api_exception.dart';
import 'package:insider/data/repositories/news/news_repository.dart';
import 'package:rest_client/rest_client.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({
    required NewsClient newsClient,
  }) : _newsClient = newsClient;

  late final NewsClient _newsClient;

  @override
  Future<ArticleListResponse> getNews(NewsArticlesFilterRequest request) async {
    return _newsClient.getNews(request).onApiError;
  }

  @override
  Future<TopicListResponse> getCategories() async {
    return _newsClient.getCategories().onApiError;
  }

  @override
  Future<ArticleDetailResponse> getNewsDetail(String newsId) async {
    return _newsClient.getNewsDetail(newsId).onApiError;
  }
}
