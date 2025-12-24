import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_models.freezed.dart';
part 'news_models.g.dart';

// Helper functions for defensive parsing
Object? _readId(Map json, String key) {
  return json['id'] ?? json['news_id'];
}

Object? _readTopic(Map json, String key) {
  if (json['topic'] != null) return json['topic'];
  if (json['category'] is List && (json['category'] as List).isNotEmpty) {
    final first = (json['category'] as List).first;
    if (first is Map) return first['category_id'] ?? first['name'] ?? '';
  }
  return '';
}

Object? _readImage(Map json, String key) {
  return json['top_image'] ?? json['image_url'];
}

Object? _readSources(Map json, String key) {
  return json['source_urls'] ?? json['sources'] ?? [];
}

Object? _readCreatedAt(Map json, String key) {
  return json['created_at'] ?? json['published_time'];
}

@freezed
abstract class NewsArticlesFilterRequest with _$NewsArticlesFilterRequest {
  const factory NewsArticlesFilterRequest({
    String? topic,
    String? locale,
    @Default(1) int page,
    @JsonKey(name: 'page_size') @Default(20) int pageSize,
  }) = _NewsArticlesFilterRequest;

  factory NewsArticlesFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$NewsArticlesFilterRequestFromJson(json);
}

@freezed
abstract class TopicItem with _$TopicItem {
  const factory TopicItem({required String slug, required String label}) =
      _TopicItem;

  factory TopicItem.fromJson(Map<String, dynamic> json) =>
      _$TopicItemFromJson(json);
}

@freezed
abstract class TopicListResponse with _$TopicListResponse {
  const factory TopicListResponse({
    @Default([]) List<TopicItem> items,
    required int total,
  }) = _TopicListResponse;

  factory TopicListResponse.fromJson(Map<String, dynamic> json) {
    final effectiveMap = json['data'] is Map
        ? json['data'] as Map<String, dynamic>
        : json;

    // Debug print to see what we are really getting
    // ignore: avoid_print
    print('TopicListResponse keys: ${effectiveMap.keys}');
    if (effectiveMap['items'] != null) {
      // ignore: avoid_print
      print('Topic items count: ${(effectiveMap['items'] as List).length}');
    } else {
      // ignore: avoid_print
      print('Topic items is NULL');
    }

    return TopicListResponse(
      items:
          (effectiveMap['items'] as List<dynamic>?)
              ?.map((e) => TopicItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: effectiveMap['total'] as int? ?? 0,
    );
  }
}

@freezed
abstract class ArticleListItem with _$ArticleListItem {
  const factory ArticleListItem({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(name: 'story_id') String? storyId,
    required String title,
    String? summary,
    @JsonKey(readValue: _readImage) String? topImage,
    @Default([]) List<String> keywords,
    @JsonKey(readValue: _readSources) @Default([]) List<String> sourceUrls,
    @JsonKey(readValue: _readTopic) required String topic,
    @Default('en') String locale,
    @JsonKey(readValue: _readCreatedAt) DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? content,
    @JsonKey(name: 'model_used') String? modelUsed,
  }) = _ArticleListItem;

  factory ArticleListItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleListItemFromJson(json);
}

@freezed
abstract class ArticleListResponse with _$ArticleListResponse {
  const factory ArticleListResponse({
    @Default([]) List<ArticleListItem> items,
    required int total,
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _ArticleListResponse;

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) {
    final effectiveMap = json['data'] is Map
        ? json['data'] as Map<String, dynamic>
        : json;

    // Debug print
    // ignore: avoid_print
    print('ArticleListResponse keys: ${effectiveMap.keys}');
    if (effectiveMap['items'] != null) {
      // ignore: avoid_print
      print('Article items count: ${(effectiveMap['items'] as List).length}');
    } else {
      // ignore: avoid_print
      print('Article items is NULL');
    }

    return ArticleListResponse(
      items:
          (effectiveMap['items'] as List<dynamic>?)
              ?.map((e) => ArticleListItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: effectiveMap['total'] as int? ?? 0,
      page: effectiveMap['page'] as int? ?? 0,
      pageSize: effectiveMap['page_size'] as int? ?? 0,
      totalPages: effectiveMap['total_pages'] as int? ?? 0,
    );
  }
}

@freezed
abstract class ArticleDetailResponse with _$ArticleDetailResponse {
  const factory ArticleDetailResponse({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(name: 'story_id') String? storyId,
    required String title,
    String? summary,
    @JsonKey(readValue: _readImage) String? topImage,
    @Default([]) List<String> keywords,
    @JsonKey(readValue: _readSources) @Default([]) List<String> sourceUrls,
    @JsonKey(readValue: _readTopic) required String topic,
    @Default('en') String locale,
    @JsonKey(readValue: _readCreatedAt) DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    required String content,
    @JsonKey(name: 'model_used') String? modelUsed,
  }) = _ArticleDetailResponse;

  factory ArticleDetailResponse.fromJson(Map<String, dynamic> json) {
    final m = json['data'] is Map ? json['data'] as Map<String, dynamic> : json;
    return ArticleDetailResponse(
      id: _readId(m, 'id') as String,
      storyId: m['story_id'] as String?,
      title: m['title'] as String? ?? '',
      summary: m['summary'] as String?,
      topImage: _readImage(m, 'topImage') as String?,
      keywords:
          (m['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      sourceUrls:
          (m['source_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          (m['sources'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      topic: _readTopic(m, 'topic') as String,
      locale: m['locale'] as String? ?? 'en',
      createdAt: _readCreatedAt(m, 'createdAt') == null
          ? null
          : (_readCreatedAt(m, 'createdAt') is DateTime
                ? _readCreatedAt(m, 'createdAt') as DateTime
                : DateTime.tryParse(_readCreatedAt(m, 'createdAt').toString())),
      updatedAt: m['updated_at'] == null
          ? null
          : DateTime.tryParse(m['updated_at'].toString()),
      content: m['content'] as String? ?? '',
      modelUsed: m['model_used'] as String?,
    );
  }
}
