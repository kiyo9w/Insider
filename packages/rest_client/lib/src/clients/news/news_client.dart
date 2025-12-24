import 'package:dio/dio.dart';
import 'package:rest_client/src/models/news/news_models.dart';
import 'package:retrofit/retrofit.dart';

part 'news_client.g.dart';

@RestApi()
abstract class NewsClient {
  factory NewsClient(Dio dio, {String baseUrl}) = _NewsClient;

  @GET('/api/v1/news/articles')
  Future<ArticleListResponse> getNews(
    @Queries() NewsArticlesFilterRequest request,
  );

  @GET('/api/v1/news/topics')
  Future<TopicListResponse> getCategories();

  // Backend does not have a specific 'category details' endpoint that returns metadata separately from topics list.
  // We can either remove this or make it call topics and filter (but client shouldn't do that logic here really).
  // For now, removing it as it's not strictly compatible with the new simple backend schema.

  @GET('/api/v1/news/articles/{news_id}')
  Future<ArticleDetailResponse> getNewsDetail(@Path('news_id') String newsId);
}
