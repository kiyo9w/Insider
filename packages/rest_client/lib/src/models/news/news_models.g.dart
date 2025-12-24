// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsArticlesFilterRequest _$NewsArticlesFilterRequestFromJson(
  Map<String, dynamic> json,
) => _NewsArticlesFilterRequest(
  topic: json['topic'] as String?,
  locale: json['locale'] as String?,
  page: (json['page'] as num?)?.toInt() ?? 1,
  pageSize: (json['page_size'] as num?)?.toInt() ?? 20,
);

Map<String, dynamic> _$NewsArticlesFilterRequestToJson(
  _NewsArticlesFilterRequest instance,
) => <String, dynamic>{
  'topic': instance.topic,
  'locale': instance.locale,
  'page': instance.page,
  'page_size': instance.pageSize,
};

_TopicItem _$TopicItemFromJson(Map<String, dynamic> json) =>
    _TopicItem(slug: json['slug'] as String, label: json['label'] as String);

Map<String, dynamic> _$TopicItemToJson(_TopicItem instance) =>
    <String, dynamic>{'slug': instance.slug, 'label': instance.label};

_ArticleListItem _$ArticleListItemFromJson(Map<String, dynamic> json) =>
    _ArticleListItem(
      id: _readId(json, 'id') as String,
      storyId: json['story_id'] as String?,
      title: json['title'] as String,
      summary: json['summary'] as String?,
      topImage: _readImage(json, 'topImage') as String?,
      keywords:
          (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sourceUrls:
          (_readSources(json, 'sourceUrls') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      topic: _readTopic(json, 'topic') as String,
      locale: json['locale'] as String? ?? 'en',
      createdAt: _readCreatedAt(json, 'createdAt') == null
          ? null
          : DateTime.parse(_readCreatedAt(json, 'createdAt') as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      content: json['content'] as String?,
      modelUsed: json['model_used'] as String?,
    );

Map<String, dynamic> _$ArticleListItemToJson(_ArticleListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'story_id': instance.storyId,
      'title': instance.title,
      'summary': instance.summary,
      'topImage': instance.topImage,
      'keywords': instance.keywords,
      'sourceUrls': instance.sourceUrls,
      'topic': instance.topic,
      'locale': instance.locale,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'content': instance.content,
      'model_used': instance.modelUsed,
    };
