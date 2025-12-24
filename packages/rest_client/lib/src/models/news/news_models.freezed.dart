// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsArticlesFilterRequest {

 String? get topic; String? get locale; int get page;@JsonKey(name: 'page_size') int get pageSize;
/// Create a copy of NewsArticlesFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsArticlesFilterRequestCopyWith<NewsArticlesFilterRequest> get copyWith => _$NewsArticlesFilterRequestCopyWithImpl<NewsArticlesFilterRequest>(this as NewsArticlesFilterRequest, _$identity);

  /// Serializes this NewsArticlesFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsArticlesFilterRequest&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,locale,page,pageSize);

@override
String toString() {
  return 'NewsArticlesFilterRequest(topic: $topic, locale: $locale, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $NewsArticlesFilterRequestCopyWith<$Res>  {
  factory $NewsArticlesFilterRequestCopyWith(NewsArticlesFilterRequest value, $Res Function(NewsArticlesFilterRequest) _then) = _$NewsArticlesFilterRequestCopyWithImpl;
@useResult
$Res call({
 String? topic, String? locale, int page,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class _$NewsArticlesFilterRequestCopyWithImpl<$Res>
    implements $NewsArticlesFilterRequestCopyWith<$Res> {
  _$NewsArticlesFilterRequestCopyWithImpl(this._self, this._then);

  final NewsArticlesFilterRequest _self;
  final $Res Function(NewsArticlesFilterRequest) _then;

/// Create a copy of NewsArticlesFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = freezed,Object? locale = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsArticlesFilterRequest].
extension NewsArticlesFilterRequestPatterns on NewsArticlesFilterRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsArticlesFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsArticlesFilterRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsArticlesFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _NewsArticlesFilterRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsArticlesFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NewsArticlesFilterRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? topic,  String? locale,  int page, @JsonKey(name: 'page_size')  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsArticlesFilterRequest() when $default != null:
return $default(_that.topic,_that.locale,_that.page,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? topic,  String? locale,  int page, @JsonKey(name: 'page_size')  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _NewsArticlesFilterRequest():
return $default(_that.topic,_that.locale,_that.page,_that.pageSize);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? topic,  String? locale,  int page, @JsonKey(name: 'page_size')  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _NewsArticlesFilterRequest() when $default != null:
return $default(_that.topic,_that.locale,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsArticlesFilterRequest implements NewsArticlesFilterRequest {
  const _NewsArticlesFilterRequest({this.topic, this.locale, this.page = 1, @JsonKey(name: 'page_size') this.pageSize = 20});
  factory _NewsArticlesFilterRequest.fromJson(Map<String, dynamic> json) => _$NewsArticlesFilterRequestFromJson(json);

@override final  String? topic;
@override final  String? locale;
@override@JsonKey() final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;

/// Create a copy of NewsArticlesFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsArticlesFilterRequestCopyWith<_NewsArticlesFilterRequest> get copyWith => __$NewsArticlesFilterRequestCopyWithImpl<_NewsArticlesFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsArticlesFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsArticlesFilterRequest&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,locale,page,pageSize);

@override
String toString() {
  return 'NewsArticlesFilterRequest(topic: $topic, locale: $locale, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$NewsArticlesFilterRequestCopyWith<$Res> implements $NewsArticlesFilterRequestCopyWith<$Res> {
  factory _$NewsArticlesFilterRequestCopyWith(_NewsArticlesFilterRequest value, $Res Function(_NewsArticlesFilterRequest) _then) = __$NewsArticlesFilterRequestCopyWithImpl;
@override @useResult
$Res call({
 String? topic, String? locale, int page,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class __$NewsArticlesFilterRequestCopyWithImpl<$Res>
    implements _$NewsArticlesFilterRequestCopyWith<$Res> {
  __$NewsArticlesFilterRequestCopyWithImpl(this._self, this._then);

  final _NewsArticlesFilterRequest _self;
  final $Res Function(_NewsArticlesFilterRequest) _then;

/// Create a copy of NewsArticlesFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = freezed,Object? locale = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_NewsArticlesFilterRequest(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TopicItem {

 String get slug; String get label;
/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicItemCopyWith<TopicItem> get copyWith => _$TopicItemCopyWithImpl<TopicItem>(this as TopicItem, _$identity);

  /// Serializes this TopicItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicItem&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,label);

@override
String toString() {
  return 'TopicItem(slug: $slug, label: $label)';
}


}

/// @nodoc
abstract mixin class $TopicItemCopyWith<$Res>  {
  factory $TopicItemCopyWith(TopicItem value, $Res Function(TopicItem) _then) = _$TopicItemCopyWithImpl;
@useResult
$Res call({
 String slug, String label
});




}
/// @nodoc
class _$TopicItemCopyWithImpl<$Res>
    implements $TopicItemCopyWith<$Res> {
  _$TopicItemCopyWithImpl(this._self, this._then);

  final TopicItem _self;
  final $Res Function(TopicItem) _then;

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? label = null,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicItem].
extension TopicItemPatterns on TopicItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicItem value)  $default,){
final _that = this;
switch (_that) {
case _TopicItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicItem value)?  $default,){
final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
return $default(_that.slug,_that.label);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String label)  $default,) {final _that = this;
switch (_that) {
case _TopicItem():
return $default(_that.slug,_that.label);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String label)?  $default,) {final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
return $default(_that.slug,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicItem implements TopicItem {
  const _TopicItem({required this.slug, required this.label});
  factory _TopicItem.fromJson(Map<String, dynamic> json) => _$TopicItemFromJson(json);

@override final  String slug;
@override final  String label;

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicItemCopyWith<_TopicItem> get copyWith => __$TopicItemCopyWithImpl<_TopicItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicItem&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,label);

@override
String toString() {
  return 'TopicItem(slug: $slug, label: $label)';
}


}

/// @nodoc
abstract mixin class _$TopicItemCopyWith<$Res> implements $TopicItemCopyWith<$Res> {
  factory _$TopicItemCopyWith(_TopicItem value, $Res Function(_TopicItem) _then) = __$TopicItemCopyWithImpl;
@override @useResult
$Res call({
 String slug, String label
});




}
/// @nodoc
class __$TopicItemCopyWithImpl<$Res>
    implements _$TopicItemCopyWith<$Res> {
  __$TopicItemCopyWithImpl(this._self, this._then);

  final _TopicItem _self;
  final $Res Function(_TopicItem) _then;

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? label = null,}) {
  return _then(_TopicItem(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TopicListResponse {

 List<TopicItem> get items; int get total;
/// Create a copy of TopicListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicListResponseCopyWith<TopicListResponse> get copyWith => _$TopicListResponseCopyWithImpl<TopicListResponse>(this as TopicListResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicListResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total);

@override
String toString() {
  return 'TopicListResponse(items: $items, total: $total)';
}


}

/// @nodoc
abstract mixin class $TopicListResponseCopyWith<$Res>  {
  factory $TopicListResponseCopyWith(TopicListResponse value, $Res Function(TopicListResponse) _then) = _$TopicListResponseCopyWithImpl;
@useResult
$Res call({
 List<TopicItem> items, int total
});




}
/// @nodoc
class _$TopicListResponseCopyWithImpl<$Res>
    implements $TopicListResponseCopyWith<$Res> {
  _$TopicListResponseCopyWithImpl(this._self, this._then);

  final TopicListResponse _self;
  final $Res Function(TopicListResponse) _then;

/// Create a copy of TopicListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TopicItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicListResponse].
extension TopicListResponsePatterns on TopicListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TopicListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TopicListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TopicItem> items,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicListResponse() when $default != null:
return $default(_that.items,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TopicItem> items,  int total)  $default,) {final _that = this;
switch (_that) {
case _TopicListResponse():
return $default(_that.items,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TopicItem> items,  int total)?  $default,) {final _that = this;
switch (_that) {
case _TopicListResponse() when $default != null:
return $default(_that.items,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _TopicListResponse implements TopicListResponse {
  const _TopicListResponse({final  List<TopicItem> items = const [], required this.total}): _items = items;
  

 final  List<TopicItem> _items;
@override@JsonKey() List<TopicItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;

/// Create a copy of TopicListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicListResponseCopyWith<_TopicListResponse> get copyWith => __$TopicListResponseCopyWithImpl<_TopicListResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicListResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total);

@override
String toString() {
  return 'TopicListResponse(items: $items, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TopicListResponseCopyWith<$Res> implements $TopicListResponseCopyWith<$Res> {
  factory _$TopicListResponseCopyWith(_TopicListResponse value, $Res Function(_TopicListResponse) _then) = __$TopicListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TopicItem> items, int total
});




}
/// @nodoc
class __$TopicListResponseCopyWithImpl<$Res>
    implements _$TopicListResponseCopyWith<$Res> {
  __$TopicListResponseCopyWithImpl(this._self, this._then);

  final _TopicListResponse _self;
  final $Res Function(_TopicListResponse) _then;

/// Create a copy of TopicListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,}) {
  return _then(_TopicListResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TopicItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ArticleListItem {

@JsonKey(readValue: _readId) String get id;@JsonKey(name: 'story_id') String? get storyId; String get title; String? get summary;@JsonKey(readValue: _readImage) String? get topImage; List<String> get keywords;@JsonKey(readValue: _readSources) List<String> get sourceUrls;@JsonKey(readValue: _readTopic) String get topic; String get locale;@JsonKey(readValue: _readCreatedAt) DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; String? get content;@JsonKey(name: 'model_used') String? get modelUsed;
/// Create a copy of ArticleListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleListItemCopyWith<ArticleListItem> get copyWith => _$ArticleListItemCopyWithImpl<ArticleListItem>(this as ArticleListItem, _$identity);

  /// Serializes this ArticleListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.storyId, storyId) || other.storyId == storyId)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.topImage, topImage) || other.topImage == topImage)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.sourceUrls, sourceUrls)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,storyId,title,summary,topImage,const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(sourceUrls),topic,locale,createdAt,updatedAt,content,modelUsed);

@override
String toString() {
  return 'ArticleListItem(id: $id, storyId: $storyId, title: $title, summary: $summary, topImage: $topImage, keywords: $keywords, sourceUrls: $sourceUrls, topic: $topic, locale: $locale, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, modelUsed: $modelUsed)';
}


}

/// @nodoc
abstract mixin class $ArticleListItemCopyWith<$Res>  {
  factory $ArticleListItemCopyWith(ArticleListItem value, $Res Function(ArticleListItem) _then) = _$ArticleListItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(name: 'story_id') String? storyId, String title, String? summary,@JsonKey(readValue: _readImage) String? topImage, List<String> keywords,@JsonKey(readValue: _readSources) List<String> sourceUrls,@JsonKey(readValue: _readTopic) String topic, String locale,@JsonKey(readValue: _readCreatedAt) DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String? content,@JsonKey(name: 'model_used') String? modelUsed
});




}
/// @nodoc
class _$ArticleListItemCopyWithImpl<$Res>
    implements $ArticleListItemCopyWith<$Res> {
  _$ArticleListItemCopyWithImpl(this._self, this._then);

  final ArticleListItem _self;
  final $Res Function(ArticleListItem) _then;

/// Create a copy of ArticleListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? storyId = freezed,Object? title = null,Object? summary = freezed,Object? topImage = freezed,Object? keywords = null,Object? sourceUrls = null,Object? topic = null,Object? locale = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? content = freezed,Object? modelUsed = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storyId: freezed == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,topImage: freezed == topImage ? _self.topImage : topImage // ignore: cast_nullable_to_non_nullable
as String?,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,sourceUrls: null == sourceUrls ? _self.sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleListItem].
extension ArticleListItemPatterns on ArticleListItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleListItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleListItem value)  $default,){
final _that = this;
switch (_that) {
case _ArticleListItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleListItem value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleListItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(name: 'story_id')  String? storyId,  String title,  String? summary, @JsonKey(readValue: _readImage)  String? topImage,  List<String> keywords, @JsonKey(readValue: _readSources)  List<String> sourceUrls, @JsonKey(readValue: _readTopic)  String topic,  String locale, @JsonKey(readValue: _readCreatedAt)  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? content, @JsonKey(name: 'model_used')  String? modelUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleListItem() when $default != null:
return $default(_that.id,_that.storyId,_that.title,_that.summary,_that.topImage,_that.keywords,_that.sourceUrls,_that.topic,_that.locale,_that.createdAt,_that.updatedAt,_that.content,_that.modelUsed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(name: 'story_id')  String? storyId,  String title,  String? summary, @JsonKey(readValue: _readImage)  String? topImage,  List<String> keywords, @JsonKey(readValue: _readSources)  List<String> sourceUrls, @JsonKey(readValue: _readTopic)  String topic,  String locale, @JsonKey(readValue: _readCreatedAt)  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? content, @JsonKey(name: 'model_used')  String? modelUsed)  $default,) {final _that = this;
switch (_that) {
case _ArticleListItem():
return $default(_that.id,_that.storyId,_that.title,_that.summary,_that.topImage,_that.keywords,_that.sourceUrls,_that.topic,_that.locale,_that.createdAt,_that.updatedAt,_that.content,_that.modelUsed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readId)  String id, @JsonKey(name: 'story_id')  String? storyId,  String title,  String? summary, @JsonKey(readValue: _readImage)  String? topImage,  List<String> keywords, @JsonKey(readValue: _readSources)  List<String> sourceUrls, @JsonKey(readValue: _readTopic)  String topic,  String locale, @JsonKey(readValue: _readCreatedAt)  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String? content, @JsonKey(name: 'model_used')  String? modelUsed)?  $default,) {final _that = this;
switch (_that) {
case _ArticleListItem() when $default != null:
return $default(_that.id,_that.storyId,_that.title,_that.summary,_that.topImage,_that.keywords,_that.sourceUrls,_that.topic,_that.locale,_that.createdAt,_that.updatedAt,_that.content,_that.modelUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleListItem implements ArticleListItem {
  const _ArticleListItem({@JsonKey(readValue: _readId) required this.id, @JsonKey(name: 'story_id') this.storyId, required this.title, this.summary, @JsonKey(readValue: _readImage) this.topImage, final  List<String> keywords = const [], @JsonKey(readValue: _readSources) final  List<String> sourceUrls = const [], @JsonKey(readValue: _readTopic) required this.topic, this.locale = 'en', @JsonKey(readValue: _readCreatedAt) this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.content, @JsonKey(name: 'model_used') this.modelUsed}): _keywords = keywords,_sourceUrls = sourceUrls;
  factory _ArticleListItem.fromJson(Map<String, dynamic> json) => _$ArticleListItemFromJson(json);

@override@JsonKey(readValue: _readId) final  String id;
@override@JsonKey(name: 'story_id') final  String? storyId;
@override final  String title;
@override final  String? summary;
@override@JsonKey(readValue: _readImage) final  String? topImage;
 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

 final  List<String> _sourceUrls;
@override@JsonKey(readValue: _readSources) List<String> get sourceUrls {
  if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sourceUrls);
}

@override@JsonKey(readValue: _readTopic) final  String topic;
@override@JsonKey() final  String locale;
@override@JsonKey(readValue: _readCreatedAt) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  String? content;
@override@JsonKey(name: 'model_used') final  String? modelUsed;

/// Create a copy of ArticleListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleListItemCopyWith<_ArticleListItem> get copyWith => __$ArticleListItemCopyWithImpl<_ArticleListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.storyId, storyId) || other.storyId == storyId)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.topImage, topImage) || other.topImage == topImage)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other._sourceUrls, _sourceUrls)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,storyId,title,summary,topImage,const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(_sourceUrls),topic,locale,createdAt,updatedAt,content,modelUsed);

@override
String toString() {
  return 'ArticleListItem(id: $id, storyId: $storyId, title: $title, summary: $summary, topImage: $topImage, keywords: $keywords, sourceUrls: $sourceUrls, topic: $topic, locale: $locale, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, modelUsed: $modelUsed)';
}


}

/// @nodoc
abstract mixin class _$ArticleListItemCopyWith<$Res> implements $ArticleListItemCopyWith<$Res> {
  factory _$ArticleListItemCopyWith(_ArticleListItem value, $Res Function(_ArticleListItem) _then) = __$ArticleListItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(name: 'story_id') String? storyId, String title, String? summary,@JsonKey(readValue: _readImage) String? topImage, List<String> keywords,@JsonKey(readValue: _readSources) List<String> sourceUrls,@JsonKey(readValue: _readTopic) String topic, String locale,@JsonKey(readValue: _readCreatedAt) DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String? content,@JsonKey(name: 'model_used') String? modelUsed
});




}
/// @nodoc
class __$ArticleListItemCopyWithImpl<$Res>
    implements _$ArticleListItemCopyWith<$Res> {
  __$ArticleListItemCopyWithImpl(this._self, this._then);

  final _ArticleListItem _self;
  final $Res Function(_ArticleListItem) _then;

/// Create a copy of ArticleListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? storyId = freezed,Object? title = null,Object? summary = freezed,Object? topImage = freezed,Object? keywords = null,Object? sourceUrls = null,Object? topic = null,Object? locale = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? content = freezed,Object? modelUsed = freezed,}) {
  return _then(_ArticleListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storyId: freezed == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,topImage: freezed == topImage ? _self.topImage : topImage // ignore: cast_nullable_to_non_nullable
as String?,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,sourceUrls: null == sourceUrls ? _self._sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ArticleListResponse {

 List<ArticleListItem> get items; int get total; int get page;@JsonKey(name: 'page_size') int get pageSize;@JsonKey(name: 'total_pages') int get totalPages;
/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleListResponseCopyWith<ArticleListResponse> get copyWith => _$ArticleListResponseCopyWithImpl<ArticleListResponse>(this as ArticleListResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleListResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,page,pageSize,totalPages);

@override
String toString() {
  return 'ArticleListResponse(items: $items, total: $total, page: $page, pageSize: $pageSize, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ArticleListResponseCopyWith<$Res>  {
  factory $ArticleListResponseCopyWith(ArticleListResponse value, $Res Function(ArticleListResponse) _then) = _$ArticleListResponseCopyWithImpl;
@useResult
$Res call({
 List<ArticleListItem> items, int total, int page,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class _$ArticleListResponseCopyWithImpl<$Res>
    implements $ArticleListResponseCopyWith<$Res> {
  _$ArticleListResponseCopyWithImpl(this._self, this._then);

  final ArticleListResponse _self;
  final $Res Function(ArticleListResponse) _then;

/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? page = null,Object? pageSize = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ArticleListItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleListResponse].
extension ArticleListResponsePatterns on ArticleListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ArticleListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ArticleListItem> items,  int total,  int page, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_pages')  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.pageSize,_that.totalPages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ArticleListItem> items,  int total,  int page, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_pages')  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _ArticleListResponse():
return $default(_that.items,_that.total,_that.page,_that.pageSize,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ArticleListItem> items,  int total,  int page, @JsonKey(name: 'page_size')  int pageSize, @JsonKey(name: 'total_pages')  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that.items,_that.total,_that.page,_that.pageSize,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc


class _ArticleListResponse implements ArticleListResponse {
  const _ArticleListResponse({final  List<ArticleListItem> items = const [], required this.total, required this.page, @JsonKey(name: 'page_size') required this.pageSize, @JsonKey(name: 'total_pages') required this.totalPages}): _items = items;
  

 final  List<ArticleListItem> _items;
@override@JsonKey() List<ArticleListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int page;
@override@JsonKey(name: 'page_size') final  int pageSize;
@override@JsonKey(name: 'total_pages') final  int totalPages;

/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleListResponseCopyWith<_ArticleListResponse> get copyWith => __$ArticleListResponseCopyWithImpl<_ArticleListResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleListResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,page,pageSize,totalPages);

@override
String toString() {
  return 'ArticleListResponse(items: $items, total: $total, page: $page, pageSize: $pageSize, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ArticleListResponseCopyWith<$Res> implements $ArticleListResponseCopyWith<$Res> {
  factory _$ArticleListResponseCopyWith(_ArticleListResponse value, $Res Function(_ArticleListResponse) _then) = __$ArticleListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ArticleListItem> items, int total, int page,@JsonKey(name: 'page_size') int pageSize,@JsonKey(name: 'total_pages') int totalPages
});




}
/// @nodoc
class __$ArticleListResponseCopyWithImpl<$Res>
    implements _$ArticleListResponseCopyWith<$Res> {
  __$ArticleListResponseCopyWithImpl(this._self, this._then);

  final _ArticleListResponse _self;
  final $Res Function(_ArticleListResponse) _then;

/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? page = null,Object? pageSize = null,Object? totalPages = null,}) {
  return _then(_ArticleListResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ArticleListItem>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ArticleDetailResponse {

@JsonKey(readValue: _readId) String get id;@JsonKey(name: 'story_id') String? get storyId; String get title; String? get summary;@JsonKey(readValue: _readImage) String? get topImage; List<String> get keywords;@JsonKey(readValue: _readSources) List<String> get sourceUrls;@JsonKey(readValue: _readTopic) String get topic; String get locale;@JsonKey(readValue: _readCreatedAt) DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; String get content;@JsonKey(name: 'model_used') String? get modelUsed;
/// Create a copy of ArticleDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleDetailResponseCopyWith<ArticleDetailResponse> get copyWith => _$ArticleDetailResponseCopyWithImpl<ArticleDetailResponse>(this as ArticleDetailResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.storyId, storyId) || other.storyId == storyId)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.topImage, topImage) || other.topImage == topImage)&&const DeepCollectionEquality().equals(other.keywords, keywords)&&const DeepCollectionEquality().equals(other.sourceUrls, sourceUrls)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed));
}


@override
int get hashCode => Object.hash(runtimeType,id,storyId,title,summary,topImage,const DeepCollectionEquality().hash(keywords),const DeepCollectionEquality().hash(sourceUrls),topic,locale,createdAt,updatedAt,content,modelUsed);

@override
String toString() {
  return 'ArticleDetailResponse(id: $id, storyId: $storyId, title: $title, summary: $summary, topImage: $topImage, keywords: $keywords, sourceUrls: $sourceUrls, topic: $topic, locale: $locale, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, modelUsed: $modelUsed)';
}


}

/// @nodoc
abstract mixin class $ArticleDetailResponseCopyWith<$Res>  {
  factory $ArticleDetailResponseCopyWith(ArticleDetailResponse value, $Res Function(ArticleDetailResponse) _then) = _$ArticleDetailResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(name: 'story_id') String? storyId, String title, String? summary,@JsonKey(readValue: _readImage) String? topImage, List<String> keywords,@JsonKey(readValue: _readSources) List<String> sourceUrls,@JsonKey(readValue: _readTopic) String topic, String locale,@JsonKey(readValue: _readCreatedAt) DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String content,@JsonKey(name: 'model_used') String? modelUsed
});




}
/// @nodoc
class _$ArticleDetailResponseCopyWithImpl<$Res>
    implements $ArticleDetailResponseCopyWith<$Res> {
  _$ArticleDetailResponseCopyWithImpl(this._self, this._then);

  final ArticleDetailResponse _self;
  final $Res Function(ArticleDetailResponse) _then;

/// Create a copy of ArticleDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? storyId = freezed,Object? title = null,Object? summary = freezed,Object? topImage = freezed,Object? keywords = null,Object? sourceUrls = null,Object? topic = null,Object? locale = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? content = null,Object? modelUsed = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storyId: freezed == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,topImage: freezed == topImage ? _self.topImage : topImage // ignore: cast_nullable_to_non_nullable
as String?,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,sourceUrls: null == sourceUrls ? _self.sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleDetailResponse].
extension ArticleDetailResponsePatterns on ArticleDetailResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleDetailResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _ArticleDetailResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleDetailResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(name: 'story_id')  String? storyId,  String title,  String? summary, @JsonKey(readValue: _readImage)  String? topImage,  List<String> keywords, @JsonKey(readValue: _readSources)  List<String> sourceUrls, @JsonKey(readValue: _readTopic)  String topic,  String locale, @JsonKey(readValue: _readCreatedAt)  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String content, @JsonKey(name: 'model_used')  String? modelUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleDetailResponse() when $default != null:
return $default(_that.id,_that.storyId,_that.title,_that.summary,_that.topImage,_that.keywords,_that.sourceUrls,_that.topic,_that.locale,_that.createdAt,_that.updatedAt,_that.content,_that.modelUsed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readId)  String id, @JsonKey(name: 'story_id')  String? storyId,  String title,  String? summary, @JsonKey(readValue: _readImage)  String? topImage,  List<String> keywords, @JsonKey(readValue: _readSources)  List<String> sourceUrls, @JsonKey(readValue: _readTopic)  String topic,  String locale, @JsonKey(readValue: _readCreatedAt)  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String content, @JsonKey(name: 'model_used')  String? modelUsed)  $default,) {final _that = this;
switch (_that) {
case _ArticleDetailResponse():
return $default(_that.id,_that.storyId,_that.title,_that.summary,_that.topImage,_that.keywords,_that.sourceUrls,_that.topic,_that.locale,_that.createdAt,_that.updatedAt,_that.content,_that.modelUsed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readId)  String id, @JsonKey(name: 'story_id')  String? storyId,  String title,  String? summary, @JsonKey(readValue: _readImage)  String? topImage,  List<String> keywords, @JsonKey(readValue: _readSources)  List<String> sourceUrls, @JsonKey(readValue: _readTopic)  String topic,  String locale, @JsonKey(readValue: _readCreatedAt)  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  String content, @JsonKey(name: 'model_used')  String? modelUsed)?  $default,) {final _that = this;
switch (_that) {
case _ArticleDetailResponse() when $default != null:
return $default(_that.id,_that.storyId,_that.title,_that.summary,_that.topImage,_that.keywords,_that.sourceUrls,_that.topic,_that.locale,_that.createdAt,_that.updatedAt,_that.content,_that.modelUsed);case _:
  return null;

}
}

}

/// @nodoc


class _ArticleDetailResponse implements ArticleDetailResponse {
  const _ArticleDetailResponse({@JsonKey(readValue: _readId) required this.id, @JsonKey(name: 'story_id') this.storyId, required this.title, this.summary, @JsonKey(readValue: _readImage) this.topImage, final  List<String> keywords = const [], @JsonKey(readValue: _readSources) final  List<String> sourceUrls = const [], @JsonKey(readValue: _readTopic) required this.topic, this.locale = 'en', @JsonKey(readValue: _readCreatedAt) this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, required this.content, @JsonKey(name: 'model_used') this.modelUsed}): _keywords = keywords,_sourceUrls = sourceUrls;
  

@override@JsonKey(readValue: _readId) final  String id;
@override@JsonKey(name: 'story_id') final  String? storyId;
@override final  String title;
@override final  String? summary;
@override@JsonKey(readValue: _readImage) final  String? topImage;
 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

 final  List<String> _sourceUrls;
@override@JsonKey(readValue: _readSources) List<String> get sourceUrls {
  if (_sourceUrls is EqualUnmodifiableListView) return _sourceUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sourceUrls);
}

@override@JsonKey(readValue: _readTopic) final  String topic;
@override@JsonKey() final  String locale;
@override@JsonKey(readValue: _readCreatedAt) final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  String content;
@override@JsonKey(name: 'model_used') final  String? modelUsed;

/// Create a copy of ArticleDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleDetailResponseCopyWith<_ArticleDetailResponse> get copyWith => __$ArticleDetailResponseCopyWithImpl<_ArticleDetailResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.storyId, storyId) || other.storyId == storyId)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.topImage, topImage) || other.topImage == topImage)&&const DeepCollectionEquality().equals(other._keywords, _keywords)&&const DeepCollectionEquality().equals(other._sourceUrls, _sourceUrls)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.content, content) || other.content == content)&&(identical(other.modelUsed, modelUsed) || other.modelUsed == modelUsed));
}


@override
int get hashCode => Object.hash(runtimeType,id,storyId,title,summary,topImage,const DeepCollectionEquality().hash(_keywords),const DeepCollectionEquality().hash(_sourceUrls),topic,locale,createdAt,updatedAt,content,modelUsed);

@override
String toString() {
  return 'ArticleDetailResponse(id: $id, storyId: $storyId, title: $title, summary: $summary, topImage: $topImage, keywords: $keywords, sourceUrls: $sourceUrls, topic: $topic, locale: $locale, createdAt: $createdAt, updatedAt: $updatedAt, content: $content, modelUsed: $modelUsed)';
}


}

/// @nodoc
abstract mixin class _$ArticleDetailResponseCopyWith<$Res> implements $ArticleDetailResponseCopyWith<$Res> {
  factory _$ArticleDetailResponseCopyWith(_ArticleDetailResponse value, $Res Function(_ArticleDetailResponse) _then) = __$ArticleDetailResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readId) String id,@JsonKey(name: 'story_id') String? storyId, String title, String? summary,@JsonKey(readValue: _readImage) String? topImage, List<String> keywords,@JsonKey(readValue: _readSources) List<String> sourceUrls,@JsonKey(readValue: _readTopic) String topic, String locale,@JsonKey(readValue: _readCreatedAt) DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, String content,@JsonKey(name: 'model_used') String? modelUsed
});




}
/// @nodoc
class __$ArticleDetailResponseCopyWithImpl<$Res>
    implements _$ArticleDetailResponseCopyWith<$Res> {
  __$ArticleDetailResponseCopyWithImpl(this._self, this._then);

  final _ArticleDetailResponse _self;
  final $Res Function(_ArticleDetailResponse) _then;

/// Create a copy of ArticleDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? storyId = freezed,Object? title = null,Object? summary = freezed,Object? topImage = freezed,Object? keywords = null,Object? sourceUrls = null,Object? topic = null,Object? locale = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? content = null,Object? modelUsed = freezed,}) {
  return _then(_ArticleDetailResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storyId: freezed == storyId ? _self.storyId : storyId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,topImage: freezed == topImage ? _self.topImage : topImage // ignore: cast_nullable_to_non_nullable
as String?,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,sourceUrls: null == sourceUrls ? _self._sourceUrls : sourceUrls // ignore: cast_nullable_to_non_nullable
as List<String>,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,modelUsed: freezed == modelUsed ? _self.modelUsed : modelUsed // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
