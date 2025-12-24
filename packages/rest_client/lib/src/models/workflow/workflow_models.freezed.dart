// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchResult {

 String get title; String get url; String get content;
/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultCopyWith<SearchResult> get copyWith => _$SearchResultCopyWithImpl<SearchResult>(this as SearchResult, _$identity);

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResult&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,content);

@override
String toString() {
  return 'SearchResult(title: $title, url: $url, content: $content)';
}


}

/// @nodoc
abstract mixin class $SearchResultCopyWith<$Res>  {
  factory $SearchResultCopyWith(SearchResult value, $Res Function(SearchResult) _then) = _$SearchResultCopyWithImpl;
@useResult
$Res call({
 String title, String url, String content
});




}
/// @nodoc
class _$SearchResultCopyWithImpl<$Res>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._self, this._then);

  final SearchResult _self;
  final $Res Function(SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? url = null,Object? content = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResult].
extension SearchResultPatterns on SearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResult value)  $default,){
final _that = this;
switch (_that) {
case _SearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String url,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.title,_that.url,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String url,  String content)  $default,) {final _that = this;
switch (_that) {
case _SearchResult():
return $default(_that.title,_that.url,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String url,  String content)?  $default,) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.title,_that.url,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResult implements SearchResult {
  const _SearchResult({required this.title, required this.url, required this.content});
  factory _SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

@override final  String title;
@override final  String url;
@override final  String content;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultCopyWith<_SearchResult> get copyWith => __$SearchResultCopyWithImpl<_SearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResult&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,content);

@override
String toString() {
  return 'SearchResult(title: $title, url: $url, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SearchResultCopyWith<$Res> implements $SearchResultCopyWith<$Res> {
  factory _$SearchResultCopyWith(_SearchResult value, $Res Function(_SearchResult) _then) = __$SearchResultCopyWithImpl;
@override @useResult
$Res call({
 String title, String url, String content
});




}
/// @nodoc
class __$SearchResultCopyWithImpl<$Res>
    implements _$SearchResultCopyWith<$Res> {
  __$SearchResultCopyWithImpl(this._self, this._then);

  final _SearchResult _self;
  final $Res Function(_SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? url = null,Object? content = null,}) {
  return _then(_SearchResult(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChatSnapshot {

 String get id; String get title; DateTime get date; String get preview;
/// Create a copy of ChatSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSnapshotCopyWith<ChatSnapshot> get copyWith => _$ChatSnapshotCopyWithImpl<ChatSnapshot>(this as ChatSnapshot, _$identity);

  /// Serializes this ChatSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,date,preview);

@override
String toString() {
  return 'ChatSnapshot(id: $id, title: $title, date: $date, preview: $preview)';
}


}

/// @nodoc
abstract mixin class $ChatSnapshotCopyWith<$Res>  {
  factory $ChatSnapshotCopyWith(ChatSnapshot value, $Res Function(ChatSnapshot) _then) = _$ChatSnapshotCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime date, String preview
});




}
/// @nodoc
class _$ChatSnapshotCopyWithImpl<$Res>
    implements $ChatSnapshotCopyWith<$Res> {
  _$ChatSnapshotCopyWithImpl(this._self, this._then);

  final ChatSnapshot _self;
  final $Res Function(ChatSnapshot) _then;

/// Create a copy of ChatSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? date = null,Object? preview = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatSnapshot].
extension ChatSnapshotPatterns on ChatSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _ChatSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime date,  String preview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSnapshot() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.preview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime date,  String preview)  $default,) {final _that = this;
switch (_that) {
case _ChatSnapshot():
return $default(_that.id,_that.title,_that.date,_that.preview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime date,  String preview)?  $default,) {final _that = this;
switch (_that) {
case _ChatSnapshot() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.preview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatSnapshot implements ChatSnapshot {
  const _ChatSnapshot({required this.id, required this.title, required this.date, required this.preview});
  factory _ChatSnapshot.fromJson(Map<String, dynamic> json) => _$ChatSnapshotFromJson(json);

@override final  String id;
@override final  String title;
@override final  DateTime date;
@override final  String preview;

/// Create a copy of ChatSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSnapshotCopyWith<_ChatSnapshot> get copyWith => __$ChatSnapshotCopyWithImpl<_ChatSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSnapshot&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,date,preview);

@override
String toString() {
  return 'ChatSnapshot(id: $id, title: $title, date: $date, preview: $preview)';
}


}

/// @nodoc
abstract mixin class _$ChatSnapshotCopyWith<$Res> implements $ChatSnapshotCopyWith<$Res> {
  factory _$ChatSnapshotCopyWith(_ChatSnapshot value, $Res Function(_ChatSnapshot) _then) = __$ChatSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime date, String preview
});




}
/// @nodoc
class __$ChatSnapshotCopyWithImpl<$Res>
    implements _$ChatSnapshotCopyWith<$Res> {
  __$ChatSnapshotCopyWithImpl(this._self, this._then);

  final _ChatSnapshot _self;
  final $Res Function(_ChatSnapshot) _then;

/// Create a copy of ChatSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? date = null,Object? preview = null,}) {
  return _then(_ChatSnapshot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ListChatHistoriesResponse {

 List<ChatSnapshot> get snapshots; int get total;
/// Create a copy of ListChatHistoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListChatHistoriesResponseCopyWith<ListChatHistoriesResponse> get copyWith => _$ListChatHistoriesResponseCopyWithImpl<ListChatHistoriesResponse>(this as ListChatHistoriesResponse, _$identity);

  /// Serializes this ListChatHistoriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListChatHistoriesResponse&&const DeepCollectionEquality().equals(other.snapshots, snapshots)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(snapshots),total);

@override
String toString() {
  return 'ListChatHistoriesResponse(snapshots: $snapshots, total: $total)';
}


}

/// @nodoc
abstract mixin class $ListChatHistoriesResponseCopyWith<$Res>  {
  factory $ListChatHistoriesResponseCopyWith(ListChatHistoriesResponse value, $Res Function(ListChatHistoriesResponse) _then) = _$ListChatHistoriesResponseCopyWithImpl;
@useResult
$Res call({
 List<ChatSnapshot> snapshots, int total
});




}
/// @nodoc
class _$ListChatHistoriesResponseCopyWithImpl<$Res>
    implements $ListChatHistoriesResponseCopyWith<$Res> {
  _$ListChatHistoriesResponseCopyWithImpl(this._self, this._then);

  final ListChatHistoriesResponse _self;
  final $Res Function(ListChatHistoriesResponse) _then;

/// Create a copy of ListChatHistoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snapshots = null,Object? total = null,}) {
  return _then(_self.copyWith(
snapshots: null == snapshots ? _self.snapshots : snapshots // ignore: cast_nullable_to_non_nullable
as List<ChatSnapshot>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ListChatHistoriesResponse].
extension ListChatHistoriesResponsePatterns on ListChatHistoriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListChatHistoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListChatHistoriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListChatHistoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _ListChatHistoriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListChatHistoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ListChatHistoriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatSnapshot> snapshots,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListChatHistoriesResponse() when $default != null:
return $default(_that.snapshots,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatSnapshot> snapshots,  int total)  $default,) {final _that = this;
switch (_that) {
case _ListChatHistoriesResponse():
return $default(_that.snapshots,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatSnapshot> snapshots,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ListChatHistoriesResponse() when $default != null:
return $default(_that.snapshots,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListChatHistoriesResponse implements ListChatHistoriesResponse {
  const _ListChatHistoriesResponse({required final  List<ChatSnapshot> snapshots, required this.total}): _snapshots = snapshots;
  factory _ListChatHistoriesResponse.fromJson(Map<String, dynamic> json) => _$ListChatHistoriesResponseFromJson(json);

 final  List<ChatSnapshot> _snapshots;
@override List<ChatSnapshot> get snapshots {
  if (_snapshots is EqualUnmodifiableListView) return _snapshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snapshots);
}

@override final  int total;

/// Create a copy of ListChatHistoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListChatHistoriesResponseCopyWith<_ListChatHistoriesResponse> get copyWith => __$ListChatHistoriesResponseCopyWithImpl<_ListChatHistoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListChatHistoriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListChatHistoriesResponse&&const DeepCollectionEquality().equals(other._snapshots, _snapshots)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_snapshots),total);

@override
String toString() {
  return 'ListChatHistoriesResponse(snapshots: $snapshots, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ListChatHistoriesResponseCopyWith<$Res> implements $ListChatHistoriesResponseCopyWith<$Res> {
  factory _$ListChatHistoriesResponseCopyWith(_ListChatHistoriesResponse value, $Res Function(_ListChatHistoriesResponse) _then) = __$ListChatHistoriesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ChatSnapshot> snapshots, int total
});




}
/// @nodoc
class __$ListChatHistoriesResponseCopyWithImpl<$Res>
    implements _$ListChatHistoriesResponseCopyWith<$Res> {
  __$ListChatHistoriesResponseCopyWithImpl(this._self, this._then);

  final _ListChatHistoriesResponse _self;
  final $Res Function(_ListChatHistoriesResponse) _then;

/// Create a copy of ListChatHistoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snapshots = null,Object? total = null,}) {
  return _then(_ListChatHistoriesResponse(
snapshots: null == snapshots ? _self._snapshots : snapshots // ignore: cast_nullable_to_non_nullable
as List<ChatSnapshot>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChatHistoryResponse {

 String get id; String get title;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; List<ChatMessage> get messages;@JsonKey(name: 'thread_id') String get threadId;@JsonKey(name: 'user_id') String get userId;
/// Create a copy of ChatHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatHistoryResponseCopyWith<ChatHistoryResponse> get copyWith => _$ChatHistoryResponseCopyWithImpl<ChatHistoryResponse>(this as ChatHistoryResponse, _$identity);

  /// Serializes this ChatHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatHistoryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,const DeepCollectionEquality().hash(messages),threadId,userId);

@override
String toString() {
  return 'ChatHistoryResponse(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, messages: $messages, threadId: $threadId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ChatHistoryResponseCopyWith<$Res>  {
  factory $ChatHistoryResponseCopyWith(ChatHistoryResponse value, $Res Function(ChatHistoryResponse) _then) = _$ChatHistoryResponseCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, List<ChatMessage> messages,@JsonKey(name: 'thread_id') String threadId,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class _$ChatHistoryResponseCopyWithImpl<$Res>
    implements $ChatHistoryResponseCopyWith<$Res> {
  _$ChatHistoryResponseCopyWithImpl(this._self, this._then);

  final ChatHistoryResponse _self;
  final $Res Function(ChatHistoryResponse) _then;

/// Create a copy of ChatHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? messages = null,Object? threadId = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatHistoryResponse].
extension ChatHistoryResponsePatterns on ChatHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChatHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChatHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<ChatMessage> messages, @JsonKey(name: 'thread_id')  String threadId, @JsonKey(name: 'user_id')  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatHistoryResponse() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.messages,_that.threadId,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<ChatMessage> messages, @JsonKey(name: 'thread_id')  String threadId, @JsonKey(name: 'user_id')  String userId)  $default,) {final _that = this;
switch (_that) {
case _ChatHistoryResponse():
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.messages,_that.threadId,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  List<ChatMessage> messages, @JsonKey(name: 'thread_id')  String threadId, @JsonKey(name: 'user_id')  String userId)?  $default,) {final _that = this;
switch (_that) {
case _ChatHistoryResponse() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.updatedAt,_that.messages,_that.threadId,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatHistoryResponse implements ChatHistoryResponse {
  const _ChatHistoryResponse({required this.id, required this.title, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, required final  List<ChatMessage> messages, @JsonKey(name: 'thread_id') required this.threadId, @JsonKey(name: 'user_id') required this.userId}): _messages = messages;
  factory _ChatHistoryResponse.fromJson(Map<String, dynamic> json) => _$ChatHistoryResponseFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
 final  List<ChatMessage> _messages;
@override List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey(name: 'thread_id') final  String threadId;
@override@JsonKey(name: 'user_id') final  String userId;

/// Create a copy of ChatHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatHistoryResponseCopyWith<_ChatHistoryResponse> get copyWith => __$ChatHistoryResponseCopyWithImpl<_ChatHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatHistoryResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,updatedAt,const DeepCollectionEquality().hash(_messages),threadId,userId);

@override
String toString() {
  return 'ChatHistoryResponse(id: $id, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, messages: $messages, threadId: $threadId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ChatHistoryResponseCopyWith<$Res> implements $ChatHistoryResponseCopyWith<$Res> {
  factory _$ChatHistoryResponseCopyWith(_ChatHistoryResponse value, $Res Function(_ChatHistoryResponse) _then) = __$ChatHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, List<ChatMessage> messages,@JsonKey(name: 'thread_id') String threadId,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class __$ChatHistoryResponseCopyWithImpl<$Res>
    implements _$ChatHistoryResponseCopyWith<$Res> {
  __$ChatHistoryResponseCopyWithImpl(this._self, this._then);

  final _ChatHistoryResponse _self;
  final $Res Function(_ChatHistoryResponse) _then;

/// Create a copy of ChatHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? messages = null,Object? threadId = null,Object? userId = null,}) {
  return _then(_ChatHistoryResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AgentSearchStep {

@JsonKey(name: 'step_number') int get stepNumber; String get step; List<String>? get queries; List<SearchResult>? get results; AgentSearchStepStatus get status; String? get thought;
/// Create a copy of AgentSearchStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentSearchStepCopyWith<AgentSearchStep> get copyWith => _$AgentSearchStepCopyWithImpl<AgentSearchStep>(this as AgentSearchStep, _$identity);

  /// Serializes this AgentSearchStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentSearchStep&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.queries, queries)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.status, status) || other.status == status)&&(identical(other.thought, thought) || other.thought == thought));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNumber,step,const DeepCollectionEquality().hash(queries),const DeepCollectionEquality().hash(results),status,thought);

@override
String toString() {
  return 'AgentSearchStep(stepNumber: $stepNumber, step: $step, queries: $queries, results: $results, status: $status, thought: $thought)';
}


}

/// @nodoc
abstract mixin class $AgentSearchStepCopyWith<$Res>  {
  factory $AgentSearchStepCopyWith(AgentSearchStep value, $Res Function(AgentSearchStep) _then) = _$AgentSearchStepCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'step_number') int stepNumber, String step, List<String>? queries, List<SearchResult>? results, AgentSearchStepStatus status, String? thought
});




}
/// @nodoc
class _$AgentSearchStepCopyWithImpl<$Res>
    implements $AgentSearchStepCopyWith<$Res> {
  _$AgentSearchStepCopyWithImpl(this._self, this._then);

  final AgentSearchStep _self;
  final $Res Function(AgentSearchStep) _then;

/// Create a copy of AgentSearchStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepNumber = null,Object? step = null,Object? queries = freezed,Object? results = freezed,Object? status = null,Object? thought = freezed,}) {
  return _then(_self.copyWith(
stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as String,queries: freezed == queries ? _self.queries : queries // ignore: cast_nullable_to_non_nullable
as List<String>?,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AgentSearchStepStatus,thought: freezed == thought ? _self.thought : thought // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentSearchStep].
extension AgentSearchStepPatterns on AgentSearchStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentSearchStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentSearchStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentSearchStep value)  $default,){
final _that = this;
switch (_that) {
case _AgentSearchStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentSearchStep value)?  $default,){
final _that = this;
switch (_that) {
case _AgentSearchStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'step_number')  int stepNumber,  String step,  List<String>? queries,  List<SearchResult>? results,  AgentSearchStepStatus status,  String? thought)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentSearchStep() when $default != null:
return $default(_that.stepNumber,_that.step,_that.queries,_that.results,_that.status,_that.thought);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'step_number')  int stepNumber,  String step,  List<String>? queries,  List<SearchResult>? results,  AgentSearchStepStatus status,  String? thought)  $default,) {final _that = this;
switch (_that) {
case _AgentSearchStep():
return $default(_that.stepNumber,_that.step,_that.queries,_that.results,_that.status,_that.thought);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'step_number')  int stepNumber,  String step,  List<String>? queries,  List<SearchResult>? results,  AgentSearchStepStatus status,  String? thought)?  $default,) {final _that = this;
switch (_that) {
case _AgentSearchStep() when $default != null:
return $default(_that.stepNumber,_that.step,_that.queries,_that.results,_that.status,_that.thought);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentSearchStep implements AgentSearchStep {
  const _AgentSearchStep({@JsonKey(name: 'step_number') required this.stepNumber, required this.step, final  List<String>? queries, final  List<SearchResult>? results, this.status = AgentSearchStepStatus.defaultValue, this.thought}): _queries = queries,_results = results;
  factory _AgentSearchStep.fromJson(Map<String, dynamic> json) => _$AgentSearchStepFromJson(json);

@override@JsonKey(name: 'step_number') final  int stepNumber;
@override final  String step;
 final  List<String>? _queries;
@override List<String>? get queries {
  final value = _queries;
  if (value == null) return null;
  if (_queries is EqualUnmodifiableListView) return _queries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SearchResult>? _results;
@override List<SearchResult>? get results {
  final value = _results;
  if (value == null) return null;
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  AgentSearchStepStatus status;
@override final  String? thought;

/// Create a copy of AgentSearchStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentSearchStepCopyWith<_AgentSearchStep> get copyWith => __$AgentSearchStepCopyWithImpl<_AgentSearchStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentSearchStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentSearchStep&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other._queries, _queries)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.status, status) || other.status == status)&&(identical(other.thought, thought) || other.thought == thought));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNumber,step,const DeepCollectionEquality().hash(_queries),const DeepCollectionEquality().hash(_results),status,thought);

@override
String toString() {
  return 'AgentSearchStep(stepNumber: $stepNumber, step: $step, queries: $queries, results: $results, status: $status, thought: $thought)';
}


}

/// @nodoc
abstract mixin class _$AgentSearchStepCopyWith<$Res> implements $AgentSearchStepCopyWith<$Res> {
  factory _$AgentSearchStepCopyWith(_AgentSearchStep value, $Res Function(_AgentSearchStep) _then) = __$AgentSearchStepCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'step_number') int stepNumber, String step, List<String>? queries, List<SearchResult>? results, AgentSearchStepStatus status, String? thought
});




}
/// @nodoc
class __$AgentSearchStepCopyWithImpl<$Res>
    implements _$AgentSearchStepCopyWith<$Res> {
  __$AgentSearchStepCopyWithImpl(this._self, this._then);

  final _AgentSearchStep _self;
  final $Res Function(_AgentSearchStep) _then;

/// Create a copy of AgentSearchStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepNumber = null,Object? step = null,Object? queries = freezed,Object? results = freezed,Object? status = null,Object? thought = freezed,}) {
  return _then(_AgentSearchStep(
stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as String,queries: freezed == queries ? _self._queries : queries // ignore: cast_nullable_to_non_nullable
as List<String>?,results: freezed == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AgentSearchStepStatus,thought: freezed == thought ? _self.thought : thought // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AgentSearchFullResponse {

 List<String>? get steps;@JsonKey(name: 'steps_details') List<AgentSearchStep>? get stepsDetails;
/// Create a copy of AgentSearchFullResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentSearchFullResponseCopyWith<AgentSearchFullResponse> get copyWith => _$AgentSearchFullResponseCopyWithImpl<AgentSearchFullResponse>(this as AgentSearchFullResponse, _$identity);

  /// Serializes this AgentSearchFullResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentSearchFullResponse&&const DeepCollectionEquality().equals(other.steps, steps)&&const DeepCollectionEquality().equals(other.stepsDetails, stepsDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(steps),const DeepCollectionEquality().hash(stepsDetails));

@override
String toString() {
  return 'AgentSearchFullResponse(steps: $steps, stepsDetails: $stepsDetails)';
}


}

/// @nodoc
abstract mixin class $AgentSearchFullResponseCopyWith<$Res>  {
  factory $AgentSearchFullResponseCopyWith(AgentSearchFullResponse value, $Res Function(AgentSearchFullResponse) _then) = _$AgentSearchFullResponseCopyWithImpl;
@useResult
$Res call({
 List<String>? steps,@JsonKey(name: 'steps_details') List<AgentSearchStep>? stepsDetails
});




}
/// @nodoc
class _$AgentSearchFullResponseCopyWithImpl<$Res>
    implements $AgentSearchFullResponseCopyWith<$Res> {
  _$AgentSearchFullResponseCopyWithImpl(this._self, this._then);

  final AgentSearchFullResponse _self;
  final $Res Function(AgentSearchFullResponse) _then;

/// Create a copy of AgentSearchFullResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = freezed,Object? stepsDetails = freezed,}) {
  return _then(_self.copyWith(
steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>?,stepsDetails: freezed == stepsDetails ? _self.stepsDetails : stepsDetails // ignore: cast_nullable_to_non_nullable
as List<AgentSearchStep>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentSearchFullResponse].
extension AgentSearchFullResponsePatterns on AgentSearchFullResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentSearchFullResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentSearchFullResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentSearchFullResponse value)  $default,){
final _that = this;
switch (_that) {
case _AgentSearchFullResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentSearchFullResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AgentSearchFullResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? steps, @JsonKey(name: 'steps_details')  List<AgentSearchStep>? stepsDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentSearchFullResponse() when $default != null:
return $default(_that.steps,_that.stepsDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? steps, @JsonKey(name: 'steps_details')  List<AgentSearchStep>? stepsDetails)  $default,) {final _that = this;
switch (_that) {
case _AgentSearchFullResponse():
return $default(_that.steps,_that.stepsDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? steps, @JsonKey(name: 'steps_details')  List<AgentSearchStep>? stepsDetails)?  $default,) {final _that = this;
switch (_that) {
case _AgentSearchFullResponse() when $default != null:
return $default(_that.steps,_that.stepsDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgentSearchFullResponse implements AgentSearchFullResponse {
  const _AgentSearchFullResponse({final  List<String>? steps, @JsonKey(name: 'steps_details') final  List<AgentSearchStep>? stepsDetails}): _steps = steps,_stepsDetails = stepsDetails;
  factory _AgentSearchFullResponse.fromJson(Map<String, dynamic> json) => _$AgentSearchFullResponseFromJson(json);

 final  List<String>? _steps;
@override List<String>? get steps {
  final value = _steps;
  if (value == null) return null;
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AgentSearchStep>? _stepsDetails;
@override@JsonKey(name: 'steps_details') List<AgentSearchStep>? get stepsDetails {
  final value = _stepsDetails;
  if (value == null) return null;
  if (_stepsDetails is EqualUnmodifiableListView) return _stepsDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AgentSearchFullResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentSearchFullResponseCopyWith<_AgentSearchFullResponse> get copyWith => __$AgentSearchFullResponseCopyWithImpl<_AgentSearchFullResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgentSearchFullResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentSearchFullResponse&&const DeepCollectionEquality().equals(other._steps, _steps)&&const DeepCollectionEquality().equals(other._stepsDetails, _stepsDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_stepsDetails));

@override
String toString() {
  return 'AgentSearchFullResponse(steps: $steps, stepsDetails: $stepsDetails)';
}


}

/// @nodoc
abstract mixin class _$AgentSearchFullResponseCopyWith<$Res> implements $AgentSearchFullResponseCopyWith<$Res> {
  factory _$AgentSearchFullResponseCopyWith(_AgentSearchFullResponse value, $Res Function(_AgentSearchFullResponse) _then) = __$AgentSearchFullResponseCopyWithImpl;
@override @useResult
$Res call({
 List<String>? steps,@JsonKey(name: 'steps_details') List<AgentSearchStep>? stepsDetails
});




}
/// @nodoc
class __$AgentSearchFullResponseCopyWithImpl<$Res>
    implements _$AgentSearchFullResponseCopyWith<$Res> {
  __$AgentSearchFullResponseCopyWithImpl(this._self, this._then);

  final _AgentSearchFullResponse _self;
  final $Res Function(_AgentSearchFullResponse) _then;

/// Create a copy of AgentSearchFullResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = freezed,Object? stepsDetails = freezed,}) {
  return _then(_AgentSearchFullResponse(
steps: freezed == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>?,stepsDetails: freezed == stepsDetails ? _self._stepsDetails : stepsDetails // ignore: cast_nullable_to_non_nullable
as List<AgentSearchStep>?,
  ));
}


}


/// @nodoc
mixin _$ChatMessage {

 String get content; MessageRole get role;@JsonKey(name: 'related_queries', includeIfNull: false) List<String>? get relatedQueries;@JsonKey(includeIfNull: false) List<SearchResult>? get sources;@JsonKey(includeIfNull: false) List<String>? get images;@JsonKey(name: 'is_error_message', includeIfNull: false) bool get isErrorMessage;@JsonKey(name: 'agent_response', includeIfNull: false) AgentSearchFullResponse? get agentResponse;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.content, content) || other.content == content)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.relatedQueries, relatedQueries)&&const DeepCollectionEquality().equals(other.sources, sources)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.isErrorMessage, isErrorMessage) || other.isErrorMessage == isErrorMessage)&&(identical(other.agentResponse, agentResponse) || other.agentResponse == agentResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,role,const DeepCollectionEquality().hash(relatedQueries),const DeepCollectionEquality().hash(sources),const DeepCollectionEquality().hash(images),isErrorMessage,agentResponse);

@override
String toString() {
  return 'ChatMessage(content: $content, role: $role, relatedQueries: $relatedQueries, sources: $sources, images: $images, isErrorMessage: $isErrorMessage, agentResponse: $agentResponse)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String content, MessageRole role,@JsonKey(name: 'related_queries', includeIfNull: false) List<String>? relatedQueries,@JsonKey(includeIfNull: false) List<SearchResult>? sources,@JsonKey(includeIfNull: false) List<String>? images,@JsonKey(name: 'is_error_message', includeIfNull: false) bool isErrorMessage,@JsonKey(name: 'agent_response', includeIfNull: false) AgentSearchFullResponse? agentResponse
});


$AgentSearchFullResponseCopyWith<$Res>? get agentResponse;

}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? role = null,Object? relatedQueries = freezed,Object? sources = freezed,Object? images = freezed,Object? isErrorMessage = null,Object? agentResponse = freezed,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,relatedQueries: freezed == relatedQueries ? _self.relatedQueries : relatedQueries // ignore: cast_nullable_to_non_nullable
as List<String>?,sources: freezed == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<SearchResult>?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,isErrorMessage: null == isErrorMessage ? _self.isErrorMessage : isErrorMessage // ignore: cast_nullable_to_non_nullable
as bool,agentResponse: freezed == agentResponse ? _self.agentResponse : agentResponse // ignore: cast_nullable_to_non_nullable
as AgentSearchFullResponse?,
  ));
}
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgentSearchFullResponseCopyWith<$Res>? get agentResponse {
    if (_self.agentResponse == null) {
    return null;
  }

  return $AgentSearchFullResponseCopyWith<$Res>(_self.agentResponse!, (value) {
    return _then(_self.copyWith(agentResponse: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  MessageRole role, @JsonKey(name: 'related_queries', includeIfNull: false)  List<String>? relatedQueries, @JsonKey(includeIfNull: false)  List<SearchResult>? sources, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(name: 'is_error_message', includeIfNull: false)  bool isErrorMessage, @JsonKey(name: 'agent_response', includeIfNull: false)  AgentSearchFullResponse? agentResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.content,_that.role,_that.relatedQueries,_that.sources,_that.images,_that.isErrorMessage,_that.agentResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  MessageRole role, @JsonKey(name: 'related_queries', includeIfNull: false)  List<String>? relatedQueries, @JsonKey(includeIfNull: false)  List<SearchResult>? sources, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(name: 'is_error_message', includeIfNull: false)  bool isErrorMessage, @JsonKey(name: 'agent_response', includeIfNull: false)  AgentSearchFullResponse? agentResponse)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.content,_that.role,_that.relatedQueries,_that.sources,_that.images,_that.isErrorMessage,_that.agentResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  MessageRole role, @JsonKey(name: 'related_queries', includeIfNull: false)  List<String>? relatedQueries, @JsonKey(includeIfNull: false)  List<SearchResult>? sources, @JsonKey(includeIfNull: false)  List<String>? images, @JsonKey(name: 'is_error_message', includeIfNull: false)  bool isErrorMessage, @JsonKey(name: 'agent_response', includeIfNull: false)  AgentSearchFullResponse? agentResponse)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.content,_that.role,_that.relatedQueries,_that.sources,_that.images,_that.isErrorMessage,_that.agentResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.content, required this.role, @JsonKey(name: 'related_queries', includeIfNull: false) final  List<String>? relatedQueries, @JsonKey(includeIfNull: false) final  List<SearchResult>? sources, @JsonKey(includeIfNull: false) final  List<String>? images, @JsonKey(name: 'is_error_message', includeIfNull: false) this.isErrorMessage = false, @JsonKey(name: 'agent_response', includeIfNull: false) this.agentResponse}): _relatedQueries = relatedQueries,_sources = sources,_images = images;
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String content;
@override final  MessageRole role;
 final  List<String>? _relatedQueries;
@override@JsonKey(name: 'related_queries', includeIfNull: false) List<String>? get relatedQueries {
  final value = _relatedQueries;
  if (value == null) return null;
  if (_relatedQueries is EqualUnmodifiableListView) return _relatedQueries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SearchResult>? _sources;
@override@JsonKey(includeIfNull: false) List<SearchResult>? get sources {
  final value = _sources;
  if (value == null) return null;
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _images;
@override@JsonKey(includeIfNull: false) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is_error_message', includeIfNull: false) final  bool isErrorMessage;
@override@JsonKey(name: 'agent_response', includeIfNull: false) final  AgentSearchFullResponse? agentResponse;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.content, content) || other.content == content)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._relatedQueries, _relatedQueries)&&const DeepCollectionEquality().equals(other._sources, _sources)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.isErrorMessage, isErrorMessage) || other.isErrorMessage == isErrorMessage)&&(identical(other.agentResponse, agentResponse) || other.agentResponse == agentResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,role,const DeepCollectionEquality().hash(_relatedQueries),const DeepCollectionEquality().hash(_sources),const DeepCollectionEquality().hash(_images),isErrorMessage,agentResponse);

@override
String toString() {
  return 'ChatMessage(content: $content, role: $role, relatedQueries: $relatedQueries, sources: $sources, images: $images, isErrorMessage: $isErrorMessage, agentResponse: $agentResponse)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String content, MessageRole role,@JsonKey(name: 'related_queries', includeIfNull: false) List<String>? relatedQueries,@JsonKey(includeIfNull: false) List<SearchResult>? sources,@JsonKey(includeIfNull: false) List<String>? images,@JsonKey(name: 'is_error_message', includeIfNull: false) bool isErrorMessage,@JsonKey(name: 'agent_response', includeIfNull: false) AgentSearchFullResponse? agentResponse
});


@override $AgentSearchFullResponseCopyWith<$Res>? get agentResponse;

}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? role = null,Object? relatedQueries = freezed,Object? sources = freezed,Object? images = freezed,Object? isErrorMessage = null,Object? agentResponse = freezed,}) {
  return _then(_ChatMessage(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,relatedQueries: freezed == relatedQueries ? _self._relatedQueries : relatedQueries // ignore: cast_nullable_to_non_nullable
as List<String>?,sources: freezed == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<SearchResult>?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,isErrorMessage: null == isErrorMessage ? _self.isErrorMessage : isErrorMessage // ignore: cast_nullable_to_non_nullable
as bool,agentResponse: freezed == agentResponse ? _self.agentResponse : agentResponse // ignore: cast_nullable_to_non_nullable
as AgentSearchFullResponse?,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgentSearchFullResponseCopyWith<$Res>? get agentResponse {
    if (_self.agentResponse == null) {
    return null;
  }

  return $AgentSearchFullResponseCopyWith<$Res>(_self.agentResponse!, (value) {
    return _then(_self.copyWith(agentResponse: value));
  });
}
}


/// @nodoc
mixin _$Resource {

 String get uri; String get title; String? get description;
/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceCopyWith<Resource> get copyWith => _$ResourceCopyWithImpl<Resource>(this as Resource, _$identity);

  /// Serializes this Resource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resource&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,title,description);

@override
String toString() {
  return 'Resource(uri: $uri, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $ResourceCopyWith<$Res>  {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) _then) = _$ResourceCopyWithImpl;
@useResult
$Res call({
 String uri, String title, String? description
});




}
/// @nodoc
class _$ResourceCopyWithImpl<$Res>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._self, this._then);

  final Resource _self;
  final $Res Function(Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,Object? title = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Resource].
extension ResourcePatterns on Resource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resource value)  $default,){
final _that = this;
switch (_that) {
case _Resource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resource value)?  $default,){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uri,  String title,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.uri,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uri,  String title,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Resource():
return $default(_that.uri,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uri,  String title,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.uri,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resource implements Resource {
  const _Resource({required this.uri, required this.title, this.description = ''});
  factory _Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

@override final  String uri;
@override final  String title;
@override@JsonKey() final  String? description;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceCopyWith<_Resource> get copyWith => __$ResourceCopyWithImpl<_Resource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resource&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,title,description);

@override
String toString() {
  return 'Resource(uri: $uri, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$ResourceCopyWith(_Resource value, $Res Function(_Resource) _then) = __$ResourceCopyWithImpl;
@override @useResult
$Res call({
 String uri, String title, String? description
});




}
/// @nodoc
class __$ResourceCopyWithImpl<$Res>
    implements _$ResourceCopyWith<$Res> {
  __$ResourceCopyWithImpl(this._self, this._then);

  final _Resource _self;
  final $Res Function(_Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? title = null,Object? description = freezed,}) {
  return _then(_Resource(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$IntraInfoConfig {

 bool get enabled;@JsonKey(name: 'max_results') int get maxResults; List<Resource> get resources;
/// Create a copy of IntraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntraInfoConfigCopyWith<IntraInfoConfig> get copyWith => _$IntraInfoConfigCopyWithImpl<IntraInfoConfig>(this as IntraInfoConfig, _$identity);

  /// Serializes this IntraInfoConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntraInfoConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.maxResults, maxResults) || other.maxResults == maxResults)&&const DeepCollectionEquality().equals(other.resources, resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,maxResults,const DeepCollectionEquality().hash(resources));

@override
String toString() {
  return 'IntraInfoConfig(enabled: $enabled, maxResults: $maxResults, resources: $resources)';
}


}

/// @nodoc
abstract mixin class $IntraInfoConfigCopyWith<$Res>  {
  factory $IntraInfoConfigCopyWith(IntraInfoConfig value, $Res Function(IntraInfoConfig) _then) = _$IntraInfoConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled,@JsonKey(name: 'max_results') int maxResults, List<Resource> resources
});




}
/// @nodoc
class _$IntraInfoConfigCopyWithImpl<$Res>
    implements $IntraInfoConfigCopyWith<$Res> {
  _$IntraInfoConfigCopyWithImpl(this._self, this._then);

  final IntraInfoConfig _self;
  final $Res Function(IntraInfoConfig) _then;

/// Create a copy of IntraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? maxResults = null,Object? resources = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,maxResults: null == maxResults ? _self.maxResults : maxResults // ignore: cast_nullable_to_non_nullable
as int,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<Resource>,
  ));
}

}


/// Adds pattern-matching-related methods to [IntraInfoConfig].
extension IntraInfoConfigPatterns on IntraInfoConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntraInfoConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntraInfoConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntraInfoConfig value)  $default,){
final _that = this;
switch (_that) {
case _IntraInfoConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntraInfoConfig value)?  $default,){
final _that = this;
switch (_that) {
case _IntraInfoConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled, @JsonKey(name: 'max_results')  int maxResults,  List<Resource> resources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntraInfoConfig() when $default != null:
return $default(_that.enabled,_that.maxResults,_that.resources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled, @JsonKey(name: 'max_results')  int maxResults,  List<Resource> resources)  $default,) {final _that = this;
switch (_that) {
case _IntraInfoConfig():
return $default(_that.enabled,_that.maxResults,_that.resources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled, @JsonKey(name: 'max_results')  int maxResults,  List<Resource> resources)?  $default,) {final _that = this;
switch (_that) {
case _IntraInfoConfig() when $default != null:
return $default(_that.enabled,_that.maxResults,_that.resources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IntraInfoConfig implements IntraInfoConfig {
  const _IntraInfoConfig({this.enabled = false, @JsonKey(name: 'max_results') this.maxResults = 3, final  List<Resource> resources = const []}): _resources = resources;
  factory _IntraInfoConfig.fromJson(Map<String, dynamic> json) => _$IntraInfoConfigFromJson(json);

@override@JsonKey() final  bool enabled;
@override@JsonKey(name: 'max_results') final  int maxResults;
 final  List<Resource> _resources;
@override@JsonKey() List<Resource> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}


/// Create a copy of IntraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntraInfoConfigCopyWith<_IntraInfoConfig> get copyWith => __$IntraInfoConfigCopyWithImpl<_IntraInfoConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntraInfoConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntraInfoConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.maxResults, maxResults) || other.maxResults == maxResults)&&const DeepCollectionEquality().equals(other._resources, _resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,maxResults,const DeepCollectionEquality().hash(_resources));

@override
String toString() {
  return 'IntraInfoConfig(enabled: $enabled, maxResults: $maxResults, resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$IntraInfoConfigCopyWith<$Res> implements $IntraInfoConfigCopyWith<$Res> {
  factory _$IntraInfoConfigCopyWith(_IntraInfoConfig value, $Res Function(_IntraInfoConfig) _then) = __$IntraInfoConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled,@JsonKey(name: 'max_results') int maxResults, List<Resource> resources
});




}
/// @nodoc
class __$IntraInfoConfigCopyWithImpl<$Res>
    implements _$IntraInfoConfigCopyWith<$Res> {
  __$IntraInfoConfigCopyWithImpl(this._self, this._then);

  final _IntraInfoConfig _self;
  final $Res Function(_IntraInfoConfig) _then;

/// Create a copy of IntraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? maxResults = null,Object? resources = null,}) {
  return _then(_IntraInfoConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,maxResults: null == maxResults ? _self.maxResults : maxResults // ignore: cast_nullable_to_non_nullable
as int,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<Resource>,
  ));
}


}


/// @nodoc
mixin _$ExtraInfoConfig {

 bool get enabled;@JsonKey(name: 'max_results') int get maxResults; List<Resource> get resources;
/// Create a copy of ExtraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtraInfoConfigCopyWith<ExtraInfoConfig> get copyWith => _$ExtraInfoConfigCopyWithImpl<ExtraInfoConfig>(this as ExtraInfoConfig, _$identity);

  /// Serializes this ExtraInfoConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtraInfoConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.maxResults, maxResults) || other.maxResults == maxResults)&&const DeepCollectionEquality().equals(other.resources, resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,maxResults,const DeepCollectionEquality().hash(resources));

@override
String toString() {
  return 'ExtraInfoConfig(enabled: $enabled, maxResults: $maxResults, resources: $resources)';
}


}

/// @nodoc
abstract mixin class $ExtraInfoConfigCopyWith<$Res>  {
  factory $ExtraInfoConfigCopyWith(ExtraInfoConfig value, $Res Function(ExtraInfoConfig) _then) = _$ExtraInfoConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled,@JsonKey(name: 'max_results') int maxResults, List<Resource> resources
});




}
/// @nodoc
class _$ExtraInfoConfigCopyWithImpl<$Res>
    implements $ExtraInfoConfigCopyWith<$Res> {
  _$ExtraInfoConfigCopyWithImpl(this._self, this._then);

  final ExtraInfoConfig _self;
  final $Res Function(ExtraInfoConfig) _then;

/// Create a copy of ExtraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? maxResults = null,Object? resources = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,maxResults: null == maxResults ? _self.maxResults : maxResults // ignore: cast_nullable_to_non_nullable
as int,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<Resource>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtraInfoConfig].
extension ExtraInfoConfigPatterns on ExtraInfoConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtraInfoConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtraInfoConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtraInfoConfig value)  $default,){
final _that = this;
switch (_that) {
case _ExtraInfoConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtraInfoConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ExtraInfoConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled, @JsonKey(name: 'max_results')  int maxResults,  List<Resource> resources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtraInfoConfig() when $default != null:
return $default(_that.enabled,_that.maxResults,_that.resources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled, @JsonKey(name: 'max_results')  int maxResults,  List<Resource> resources)  $default,) {final _that = this;
switch (_that) {
case _ExtraInfoConfig():
return $default(_that.enabled,_that.maxResults,_that.resources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled, @JsonKey(name: 'max_results')  int maxResults,  List<Resource> resources)?  $default,) {final _that = this;
switch (_that) {
case _ExtraInfoConfig() when $default != null:
return $default(_that.enabled,_that.maxResults,_that.resources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtraInfoConfig implements ExtraInfoConfig {
  const _ExtraInfoConfig({this.enabled = true, @JsonKey(name: 'max_results') this.maxResults = 3, final  List<Resource> resources = const []}): _resources = resources;
  factory _ExtraInfoConfig.fromJson(Map<String, dynamic> json) => _$ExtraInfoConfigFromJson(json);

@override@JsonKey() final  bool enabled;
@override@JsonKey(name: 'max_results') final  int maxResults;
 final  List<Resource> _resources;
@override@JsonKey() List<Resource> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}


/// Create a copy of ExtraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtraInfoConfigCopyWith<_ExtraInfoConfig> get copyWith => __$ExtraInfoConfigCopyWithImpl<_ExtraInfoConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtraInfoConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtraInfoConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.maxResults, maxResults) || other.maxResults == maxResults)&&const DeepCollectionEquality().equals(other._resources, _resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,maxResults,const DeepCollectionEquality().hash(_resources));

@override
String toString() {
  return 'ExtraInfoConfig(enabled: $enabled, maxResults: $maxResults, resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$ExtraInfoConfigCopyWith<$Res> implements $ExtraInfoConfigCopyWith<$Res> {
  factory _$ExtraInfoConfigCopyWith(_ExtraInfoConfig value, $Res Function(_ExtraInfoConfig) _then) = __$ExtraInfoConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled,@JsonKey(name: 'max_results') int maxResults, List<Resource> resources
});




}
/// @nodoc
class __$ExtraInfoConfigCopyWithImpl<$Res>
    implements _$ExtraInfoConfigCopyWith<$Res> {
  __$ExtraInfoConfigCopyWithImpl(this._self, this._then);

  final _ExtraInfoConfig _self;
  final $Res Function(_ExtraInfoConfig) _then;

/// Create a copy of ExtraInfoConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? maxResults = null,Object? resources = null,}) {
  return _then(_ExtraInfoConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,maxResults: null == maxResults ? _self.maxResults : maxResults // ignore: cast_nullable_to_non_nullable
as int,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<Resource>,
  ));
}


}


/// @nodoc
mixin _$WorkflowConfig {

 bool? get debug;@JsonKey(name: 'max_plan_iterations') int? get maxPlanIterations;@JsonKey(name: 'max_step_num') int? get maxStepNum;@JsonKey(name: 'auto_accepted_plan') bool? get autoAcceptedPlan;@JsonKey(name: 'enable_background_investigation') bool? get enableBackgroundInvestigation;@JsonKey(name: 'interrupt_feedback') String? get interruptFeedback;@JsonKey(name: 'mcp_settings') Map<String, dynamic>? get mcpSettings;
/// Create a copy of WorkflowConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkflowConfigCopyWith<WorkflowConfig> get copyWith => _$WorkflowConfigCopyWithImpl<WorkflowConfig>(this as WorkflowConfig, _$identity);

  /// Serializes this WorkflowConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkflowConfig&&(identical(other.debug, debug) || other.debug == debug)&&(identical(other.maxPlanIterations, maxPlanIterations) || other.maxPlanIterations == maxPlanIterations)&&(identical(other.maxStepNum, maxStepNum) || other.maxStepNum == maxStepNum)&&(identical(other.autoAcceptedPlan, autoAcceptedPlan) || other.autoAcceptedPlan == autoAcceptedPlan)&&(identical(other.enableBackgroundInvestigation, enableBackgroundInvestigation) || other.enableBackgroundInvestigation == enableBackgroundInvestigation)&&(identical(other.interruptFeedback, interruptFeedback) || other.interruptFeedback == interruptFeedback)&&const DeepCollectionEquality().equals(other.mcpSettings, mcpSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debug,maxPlanIterations,maxStepNum,autoAcceptedPlan,enableBackgroundInvestigation,interruptFeedback,const DeepCollectionEquality().hash(mcpSettings));

@override
String toString() {
  return 'WorkflowConfig(debug: $debug, maxPlanIterations: $maxPlanIterations, maxStepNum: $maxStepNum, autoAcceptedPlan: $autoAcceptedPlan, enableBackgroundInvestigation: $enableBackgroundInvestigation, interruptFeedback: $interruptFeedback, mcpSettings: $mcpSettings)';
}


}

/// @nodoc
abstract mixin class $WorkflowConfigCopyWith<$Res>  {
  factory $WorkflowConfigCopyWith(WorkflowConfig value, $Res Function(WorkflowConfig) _then) = _$WorkflowConfigCopyWithImpl;
@useResult
$Res call({
 bool? debug,@JsonKey(name: 'max_plan_iterations') int? maxPlanIterations,@JsonKey(name: 'max_step_num') int? maxStepNum,@JsonKey(name: 'auto_accepted_plan') bool? autoAcceptedPlan,@JsonKey(name: 'enable_background_investigation') bool? enableBackgroundInvestigation,@JsonKey(name: 'interrupt_feedback') String? interruptFeedback,@JsonKey(name: 'mcp_settings') Map<String, dynamic>? mcpSettings
});




}
/// @nodoc
class _$WorkflowConfigCopyWithImpl<$Res>
    implements $WorkflowConfigCopyWith<$Res> {
  _$WorkflowConfigCopyWithImpl(this._self, this._then);

  final WorkflowConfig _self;
  final $Res Function(WorkflowConfig) _then;

/// Create a copy of WorkflowConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debug = freezed,Object? maxPlanIterations = freezed,Object? maxStepNum = freezed,Object? autoAcceptedPlan = freezed,Object? enableBackgroundInvestigation = freezed,Object? interruptFeedback = freezed,Object? mcpSettings = freezed,}) {
  return _then(_self.copyWith(
debug: freezed == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool?,maxPlanIterations: freezed == maxPlanIterations ? _self.maxPlanIterations : maxPlanIterations // ignore: cast_nullable_to_non_nullable
as int?,maxStepNum: freezed == maxStepNum ? _self.maxStepNum : maxStepNum // ignore: cast_nullable_to_non_nullable
as int?,autoAcceptedPlan: freezed == autoAcceptedPlan ? _self.autoAcceptedPlan : autoAcceptedPlan // ignore: cast_nullable_to_non_nullable
as bool?,enableBackgroundInvestigation: freezed == enableBackgroundInvestigation ? _self.enableBackgroundInvestigation : enableBackgroundInvestigation // ignore: cast_nullable_to_non_nullable
as bool?,interruptFeedback: freezed == interruptFeedback ? _self.interruptFeedback : interruptFeedback // ignore: cast_nullable_to_non_nullable
as String?,mcpSettings: freezed == mcpSettings ? _self.mcpSettings : mcpSettings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkflowConfig].
extension WorkflowConfigPatterns on WorkflowConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkflowConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkflowConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkflowConfig value)  $default,){
final _that = this;
switch (_that) {
case _WorkflowConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkflowConfig value)?  $default,){
final _that = this;
switch (_that) {
case _WorkflowConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? debug, @JsonKey(name: 'max_plan_iterations')  int? maxPlanIterations, @JsonKey(name: 'max_step_num')  int? maxStepNum, @JsonKey(name: 'auto_accepted_plan')  bool? autoAcceptedPlan, @JsonKey(name: 'enable_background_investigation')  bool? enableBackgroundInvestigation, @JsonKey(name: 'interrupt_feedback')  String? interruptFeedback, @JsonKey(name: 'mcp_settings')  Map<String, dynamic>? mcpSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkflowConfig() when $default != null:
return $default(_that.debug,_that.maxPlanIterations,_that.maxStepNum,_that.autoAcceptedPlan,_that.enableBackgroundInvestigation,_that.interruptFeedback,_that.mcpSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? debug, @JsonKey(name: 'max_plan_iterations')  int? maxPlanIterations, @JsonKey(name: 'max_step_num')  int? maxStepNum, @JsonKey(name: 'auto_accepted_plan')  bool? autoAcceptedPlan, @JsonKey(name: 'enable_background_investigation')  bool? enableBackgroundInvestigation, @JsonKey(name: 'interrupt_feedback')  String? interruptFeedback, @JsonKey(name: 'mcp_settings')  Map<String, dynamic>? mcpSettings)  $default,) {final _that = this;
switch (_that) {
case _WorkflowConfig():
return $default(_that.debug,_that.maxPlanIterations,_that.maxStepNum,_that.autoAcceptedPlan,_that.enableBackgroundInvestigation,_that.interruptFeedback,_that.mcpSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? debug, @JsonKey(name: 'max_plan_iterations')  int? maxPlanIterations, @JsonKey(name: 'max_step_num')  int? maxStepNum, @JsonKey(name: 'auto_accepted_plan')  bool? autoAcceptedPlan, @JsonKey(name: 'enable_background_investigation')  bool? enableBackgroundInvestigation, @JsonKey(name: 'interrupt_feedback')  String? interruptFeedback, @JsonKey(name: 'mcp_settings')  Map<String, dynamic>? mcpSettings)?  $default,) {final _that = this;
switch (_that) {
case _WorkflowConfig() when $default != null:
return $default(_that.debug,_that.maxPlanIterations,_that.maxStepNum,_that.autoAcceptedPlan,_that.enableBackgroundInvestigation,_that.interruptFeedback,_that.mcpSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkflowConfig implements WorkflowConfig {
  const _WorkflowConfig({this.debug = false, @JsonKey(name: 'max_plan_iterations') this.maxPlanIterations = 1, @JsonKey(name: 'max_step_num') this.maxStepNum = 3, @JsonKey(name: 'auto_accepted_plan') this.autoAcceptedPlan = false, @JsonKey(name: 'enable_background_investigation') this.enableBackgroundInvestigation = true, @JsonKey(name: 'interrupt_feedback') this.interruptFeedback, @JsonKey(name: 'mcp_settings') final  Map<String, dynamic>? mcpSettings}): _mcpSettings = mcpSettings;
  factory _WorkflowConfig.fromJson(Map<String, dynamic> json) => _$WorkflowConfigFromJson(json);

@override@JsonKey() final  bool? debug;
@override@JsonKey(name: 'max_plan_iterations') final  int? maxPlanIterations;
@override@JsonKey(name: 'max_step_num') final  int? maxStepNum;
@override@JsonKey(name: 'auto_accepted_plan') final  bool? autoAcceptedPlan;
@override@JsonKey(name: 'enable_background_investigation') final  bool? enableBackgroundInvestigation;
@override@JsonKey(name: 'interrupt_feedback') final  String? interruptFeedback;
 final  Map<String, dynamic>? _mcpSettings;
@override@JsonKey(name: 'mcp_settings') Map<String, dynamic>? get mcpSettings {
  final value = _mcpSettings;
  if (value == null) return null;
  if (_mcpSettings is EqualUnmodifiableMapView) return _mcpSettings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of WorkflowConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkflowConfigCopyWith<_WorkflowConfig> get copyWith => __$WorkflowConfigCopyWithImpl<_WorkflowConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkflowConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkflowConfig&&(identical(other.debug, debug) || other.debug == debug)&&(identical(other.maxPlanIterations, maxPlanIterations) || other.maxPlanIterations == maxPlanIterations)&&(identical(other.maxStepNum, maxStepNum) || other.maxStepNum == maxStepNum)&&(identical(other.autoAcceptedPlan, autoAcceptedPlan) || other.autoAcceptedPlan == autoAcceptedPlan)&&(identical(other.enableBackgroundInvestigation, enableBackgroundInvestigation) || other.enableBackgroundInvestigation == enableBackgroundInvestigation)&&(identical(other.interruptFeedback, interruptFeedback) || other.interruptFeedback == interruptFeedback)&&const DeepCollectionEquality().equals(other._mcpSettings, _mcpSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debug,maxPlanIterations,maxStepNum,autoAcceptedPlan,enableBackgroundInvestigation,interruptFeedback,const DeepCollectionEquality().hash(_mcpSettings));

@override
String toString() {
  return 'WorkflowConfig(debug: $debug, maxPlanIterations: $maxPlanIterations, maxStepNum: $maxStepNum, autoAcceptedPlan: $autoAcceptedPlan, enableBackgroundInvestigation: $enableBackgroundInvestigation, interruptFeedback: $interruptFeedback, mcpSettings: $mcpSettings)';
}


}

/// @nodoc
abstract mixin class _$WorkflowConfigCopyWith<$Res> implements $WorkflowConfigCopyWith<$Res> {
  factory _$WorkflowConfigCopyWith(_WorkflowConfig value, $Res Function(_WorkflowConfig) _then) = __$WorkflowConfigCopyWithImpl;
@override @useResult
$Res call({
 bool? debug,@JsonKey(name: 'max_plan_iterations') int? maxPlanIterations,@JsonKey(name: 'max_step_num') int? maxStepNum,@JsonKey(name: 'auto_accepted_plan') bool? autoAcceptedPlan,@JsonKey(name: 'enable_background_investigation') bool? enableBackgroundInvestigation,@JsonKey(name: 'interrupt_feedback') String? interruptFeedback,@JsonKey(name: 'mcp_settings') Map<String, dynamic>? mcpSettings
});




}
/// @nodoc
class __$WorkflowConfigCopyWithImpl<$Res>
    implements _$WorkflowConfigCopyWith<$Res> {
  __$WorkflowConfigCopyWithImpl(this._self, this._then);

  final _WorkflowConfig _self;
  final $Res Function(_WorkflowConfig) _then;

/// Create a copy of WorkflowConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debug = freezed,Object? maxPlanIterations = freezed,Object? maxStepNum = freezed,Object? autoAcceptedPlan = freezed,Object? enableBackgroundInvestigation = freezed,Object? interruptFeedback = freezed,Object? mcpSettings = freezed,}) {
  return _then(_WorkflowConfig(
debug: freezed == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool?,maxPlanIterations: freezed == maxPlanIterations ? _self.maxPlanIterations : maxPlanIterations // ignore: cast_nullable_to_non_nullable
as int?,maxStepNum: freezed == maxStepNum ? _self.maxStepNum : maxStepNum // ignore: cast_nullable_to_non_nullable
as int?,autoAcceptedPlan: freezed == autoAcceptedPlan ? _self.autoAcceptedPlan : autoAcceptedPlan // ignore: cast_nullable_to_non_nullable
as bool?,enableBackgroundInvestigation: freezed == enableBackgroundInvestigation ? _self.enableBackgroundInvestigation : enableBackgroundInvestigation // ignore: cast_nullable_to_non_nullable
as bool?,interruptFeedback: freezed == interruptFeedback ? _self.interruptFeedback : interruptFeedback // ignore: cast_nullable_to_non_nullable
as String?,mcpSettings: freezed == mcpSettings ? _self._mcpSettings : mcpSettings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$ChatRequest {

 List<ChatMessage> get messages;@JsonKey(name: 'conversation_id') String get conversationId;@JsonKey(name: 'thread_id') String get threadId;@JsonKey(name: 'workflow_config', includeIfNull: false) WorkflowConfig? get workflowConfig;@JsonKey(name: 'report_style', includeIfNull: false) ReportStyle? get reportStyle;@JsonKey(name: 'intra_info_config', includeIfNull: false) IntraInfoConfig? get intraInfoConfig;@JsonKey(name: 'extra_info_config', includeIfNull: false) ExtraInfoConfig? get extraInfoConfig;@JsonKey(includeIfNull: false) String? get provider;/// Workflow mode for unified chat endpoint (simple_qa or deep_qa)
@JsonKey(includeIfNull: false) ChatMode? get mode;
/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRequestCopyWith<ChatRequest> get copyWith => _$ChatRequestCopyWithImpl<ChatRequest>(this as ChatRequest, _$identity);

  /// Serializes this ChatRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRequest&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.workflowConfig, workflowConfig) || other.workflowConfig == workflowConfig)&&(identical(other.reportStyle, reportStyle) || other.reportStyle == reportStyle)&&(identical(other.intraInfoConfig, intraInfoConfig) || other.intraInfoConfig == intraInfoConfig)&&(identical(other.extraInfoConfig, extraInfoConfig) || other.extraInfoConfig == extraInfoConfig)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),conversationId,threadId,workflowConfig,reportStyle,intraInfoConfig,extraInfoConfig,provider,mode);

@override
String toString() {
  return 'ChatRequest(messages: $messages, conversationId: $conversationId, threadId: $threadId, workflowConfig: $workflowConfig, reportStyle: $reportStyle, intraInfoConfig: $intraInfoConfig, extraInfoConfig: $extraInfoConfig, provider: $provider, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $ChatRequestCopyWith<$Res>  {
  factory $ChatRequestCopyWith(ChatRequest value, $Res Function(ChatRequest) _then) = _$ChatRequestCopyWithImpl;
@useResult
$Res call({
 List<ChatMessage> messages,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'thread_id') String threadId,@JsonKey(name: 'workflow_config', includeIfNull: false) WorkflowConfig? workflowConfig,@JsonKey(name: 'report_style', includeIfNull: false) ReportStyle? reportStyle,@JsonKey(name: 'intra_info_config', includeIfNull: false) IntraInfoConfig? intraInfoConfig,@JsonKey(name: 'extra_info_config', includeIfNull: false) ExtraInfoConfig? extraInfoConfig,@JsonKey(includeIfNull: false) String? provider,@JsonKey(includeIfNull: false) ChatMode? mode
});


$WorkflowConfigCopyWith<$Res>? get workflowConfig;$IntraInfoConfigCopyWith<$Res>? get intraInfoConfig;$ExtraInfoConfigCopyWith<$Res>? get extraInfoConfig;

}
/// @nodoc
class _$ChatRequestCopyWithImpl<$Res>
    implements $ChatRequestCopyWith<$Res> {
  _$ChatRequestCopyWithImpl(this._self, this._then);

  final ChatRequest _self;
  final $Res Function(ChatRequest) _then;

/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? conversationId = null,Object? threadId = null,Object? workflowConfig = freezed,Object? reportStyle = freezed,Object? intraInfoConfig = freezed,Object? extraInfoConfig = freezed,Object? provider = freezed,Object? mode = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,workflowConfig: freezed == workflowConfig ? _self.workflowConfig : workflowConfig // ignore: cast_nullable_to_non_nullable
as WorkflowConfig?,reportStyle: freezed == reportStyle ? _self.reportStyle : reportStyle // ignore: cast_nullable_to_non_nullable
as ReportStyle?,intraInfoConfig: freezed == intraInfoConfig ? _self.intraInfoConfig : intraInfoConfig // ignore: cast_nullable_to_non_nullable
as IntraInfoConfig?,extraInfoConfig: freezed == extraInfoConfig ? _self.extraInfoConfig : extraInfoConfig // ignore: cast_nullable_to_non_nullable
as ExtraInfoConfig?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ChatMode?,
  ));
}
/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkflowConfigCopyWith<$Res>? get workflowConfig {
    if (_self.workflowConfig == null) {
    return null;
  }

  return $WorkflowConfigCopyWith<$Res>(_self.workflowConfig!, (value) {
    return _then(_self.copyWith(workflowConfig: value));
  });
}/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IntraInfoConfigCopyWith<$Res>? get intraInfoConfig {
    if (_self.intraInfoConfig == null) {
    return null;
  }

  return $IntraInfoConfigCopyWith<$Res>(_self.intraInfoConfig!, (value) {
    return _then(_self.copyWith(intraInfoConfig: value));
  });
}/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtraInfoConfigCopyWith<$Res>? get extraInfoConfig {
    if (_self.extraInfoConfig == null) {
    return null;
  }

  return $ExtraInfoConfigCopyWith<$Res>(_self.extraInfoConfig!, (value) {
    return _then(_self.copyWith(extraInfoConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatRequest].
extension ChatRequestPatterns on ChatRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChatRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessage> messages, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'thread_id')  String threadId, @JsonKey(name: 'workflow_config', includeIfNull: false)  WorkflowConfig? workflowConfig, @JsonKey(name: 'report_style', includeIfNull: false)  ReportStyle? reportStyle, @JsonKey(name: 'intra_info_config', includeIfNull: false)  IntraInfoConfig? intraInfoConfig, @JsonKey(name: 'extra_info_config', includeIfNull: false)  ExtraInfoConfig? extraInfoConfig, @JsonKey(includeIfNull: false)  String? provider, @JsonKey(includeIfNull: false)  ChatMode? mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
return $default(_that.messages,_that.conversationId,_that.threadId,_that.workflowConfig,_that.reportStyle,_that.intraInfoConfig,_that.extraInfoConfig,_that.provider,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessage> messages, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'thread_id')  String threadId, @JsonKey(name: 'workflow_config', includeIfNull: false)  WorkflowConfig? workflowConfig, @JsonKey(name: 'report_style', includeIfNull: false)  ReportStyle? reportStyle, @JsonKey(name: 'intra_info_config', includeIfNull: false)  IntraInfoConfig? intraInfoConfig, @JsonKey(name: 'extra_info_config', includeIfNull: false)  ExtraInfoConfig? extraInfoConfig, @JsonKey(includeIfNull: false)  String? provider, @JsonKey(includeIfNull: false)  ChatMode? mode)  $default,) {final _that = this;
switch (_that) {
case _ChatRequest():
return $default(_that.messages,_that.conversationId,_that.threadId,_that.workflowConfig,_that.reportStyle,_that.intraInfoConfig,_that.extraInfoConfig,_that.provider,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessage> messages, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'thread_id')  String threadId, @JsonKey(name: 'workflow_config', includeIfNull: false)  WorkflowConfig? workflowConfig, @JsonKey(name: 'report_style', includeIfNull: false)  ReportStyle? reportStyle, @JsonKey(name: 'intra_info_config', includeIfNull: false)  IntraInfoConfig? intraInfoConfig, @JsonKey(name: 'extra_info_config', includeIfNull: false)  ExtraInfoConfig? extraInfoConfig, @JsonKey(includeIfNull: false)  String? provider, @JsonKey(includeIfNull: false)  ChatMode? mode)?  $default,) {final _that = this;
switch (_that) {
case _ChatRequest() when $default != null:
return $default(_that.messages,_that.conversationId,_that.threadId,_that.workflowConfig,_that.reportStyle,_that.intraInfoConfig,_that.extraInfoConfig,_that.provider,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRequest implements ChatRequest {
  const _ChatRequest({required final  List<ChatMessage> messages, @JsonKey(name: 'conversation_id') required this.conversationId, @JsonKey(name: 'thread_id') required this.threadId, @JsonKey(name: 'workflow_config', includeIfNull: false) this.workflowConfig, @JsonKey(name: 'report_style', includeIfNull: false) this.reportStyle, @JsonKey(name: 'intra_info_config', includeIfNull: false) this.intraInfoConfig, @JsonKey(name: 'extra_info_config', includeIfNull: false) this.extraInfoConfig, @JsonKey(includeIfNull: false) this.provider, @JsonKey(includeIfNull: false) this.mode}): _messages = messages;
  factory _ChatRequest.fromJson(Map<String, dynamic> json) => _$ChatRequestFromJson(json);

 final  List<ChatMessage> _messages;
@override List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey(name: 'conversation_id') final  String conversationId;
@override@JsonKey(name: 'thread_id') final  String threadId;
@override@JsonKey(name: 'workflow_config', includeIfNull: false) final  WorkflowConfig? workflowConfig;
@override@JsonKey(name: 'report_style', includeIfNull: false) final  ReportStyle? reportStyle;
@override@JsonKey(name: 'intra_info_config', includeIfNull: false) final  IntraInfoConfig? intraInfoConfig;
@override@JsonKey(name: 'extra_info_config', includeIfNull: false) final  ExtraInfoConfig? extraInfoConfig;
@override@JsonKey(includeIfNull: false) final  String? provider;
/// Workflow mode for unified chat endpoint (simple_qa or deep_qa)
@override@JsonKey(includeIfNull: false) final  ChatMode? mode;

/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRequestCopyWith<_ChatRequest> get copyWith => __$ChatRequestCopyWithImpl<_ChatRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRequest&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.workflowConfig, workflowConfig) || other.workflowConfig == workflowConfig)&&(identical(other.reportStyle, reportStyle) || other.reportStyle == reportStyle)&&(identical(other.intraInfoConfig, intraInfoConfig) || other.intraInfoConfig == intraInfoConfig)&&(identical(other.extraInfoConfig, extraInfoConfig) || other.extraInfoConfig == extraInfoConfig)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),conversationId,threadId,workflowConfig,reportStyle,intraInfoConfig,extraInfoConfig,provider,mode);

@override
String toString() {
  return 'ChatRequest(messages: $messages, conversationId: $conversationId, threadId: $threadId, workflowConfig: $workflowConfig, reportStyle: $reportStyle, intraInfoConfig: $intraInfoConfig, extraInfoConfig: $extraInfoConfig, provider: $provider, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$ChatRequestCopyWith<$Res> implements $ChatRequestCopyWith<$Res> {
  factory _$ChatRequestCopyWith(_ChatRequest value, $Res Function(_ChatRequest) _then) = __$ChatRequestCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessage> messages,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'thread_id') String threadId,@JsonKey(name: 'workflow_config', includeIfNull: false) WorkflowConfig? workflowConfig,@JsonKey(name: 'report_style', includeIfNull: false) ReportStyle? reportStyle,@JsonKey(name: 'intra_info_config', includeIfNull: false) IntraInfoConfig? intraInfoConfig,@JsonKey(name: 'extra_info_config', includeIfNull: false) ExtraInfoConfig? extraInfoConfig,@JsonKey(includeIfNull: false) String? provider,@JsonKey(includeIfNull: false) ChatMode? mode
});


@override $WorkflowConfigCopyWith<$Res>? get workflowConfig;@override $IntraInfoConfigCopyWith<$Res>? get intraInfoConfig;@override $ExtraInfoConfigCopyWith<$Res>? get extraInfoConfig;

}
/// @nodoc
class __$ChatRequestCopyWithImpl<$Res>
    implements _$ChatRequestCopyWith<$Res> {
  __$ChatRequestCopyWithImpl(this._self, this._then);

  final _ChatRequest _self;
  final $Res Function(_ChatRequest) _then;

/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? conversationId = null,Object? threadId = null,Object? workflowConfig = freezed,Object? reportStyle = freezed,Object? intraInfoConfig = freezed,Object? extraInfoConfig = freezed,Object? provider = freezed,Object? mode = freezed,}) {
  return _then(_ChatRequest(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,workflowConfig: freezed == workflowConfig ? _self.workflowConfig : workflowConfig // ignore: cast_nullable_to_non_nullable
as WorkflowConfig?,reportStyle: freezed == reportStyle ? _self.reportStyle : reportStyle // ignore: cast_nullable_to_non_nullable
as ReportStyle?,intraInfoConfig: freezed == intraInfoConfig ? _self.intraInfoConfig : intraInfoConfig // ignore: cast_nullable_to_non_nullable
as IntraInfoConfig?,extraInfoConfig: freezed == extraInfoConfig ? _self.extraInfoConfig : extraInfoConfig // ignore: cast_nullable_to_non_nullable
as ExtraInfoConfig?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ChatMode?,
  ));
}

/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkflowConfigCopyWith<$Res>? get workflowConfig {
    if (_self.workflowConfig == null) {
    return null;
  }

  return $WorkflowConfigCopyWith<$Res>(_self.workflowConfig!, (value) {
    return _then(_self.copyWith(workflowConfig: value));
  });
}/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IntraInfoConfigCopyWith<$Res>? get intraInfoConfig {
    if (_self.intraInfoConfig == null) {
    return null;
  }

  return $IntraInfoConfigCopyWith<$Res>(_self.intraInfoConfig!, (value) {
    return _then(_self.copyWith(intraInfoConfig: value));
  });
}/// Create a copy of ChatRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtraInfoConfigCopyWith<$Res>? get extraInfoConfig {
    if (_self.extraInfoConfig == null) {
    return null;
  }

  return $ExtraInfoConfigCopyWith<$Res>(_self.extraInfoConfig!, (value) {
    return _then(_self.copyWith(extraInfoConfig: value));
  });
}
}


/// @nodoc
mixin _$EnhancePromptRequest {

 String get prompt; String? get context;@JsonKey(name: 'report_style') String? get reportStyle;
/// Create a copy of EnhancePromptRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnhancePromptRequestCopyWith<EnhancePromptRequest> get copyWith => _$EnhancePromptRequestCopyWithImpl<EnhancePromptRequest>(this as EnhancePromptRequest, _$identity);

  /// Serializes this EnhancePromptRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnhancePromptRequest&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.context, context) || other.context == context)&&(identical(other.reportStyle, reportStyle) || other.reportStyle == reportStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prompt,context,reportStyle);

@override
String toString() {
  return 'EnhancePromptRequest(prompt: $prompt, context: $context, reportStyle: $reportStyle)';
}


}

/// @nodoc
abstract mixin class $EnhancePromptRequestCopyWith<$Res>  {
  factory $EnhancePromptRequestCopyWith(EnhancePromptRequest value, $Res Function(EnhancePromptRequest) _then) = _$EnhancePromptRequestCopyWithImpl;
@useResult
$Res call({
 String prompt, String? context,@JsonKey(name: 'report_style') String? reportStyle
});




}
/// @nodoc
class _$EnhancePromptRequestCopyWithImpl<$Res>
    implements $EnhancePromptRequestCopyWith<$Res> {
  _$EnhancePromptRequestCopyWithImpl(this._self, this._then);

  final EnhancePromptRequest _self;
  final $Res Function(EnhancePromptRequest) _then;

/// Create a copy of EnhancePromptRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prompt = null,Object? context = freezed,Object? reportStyle = freezed,}) {
  return _then(_self.copyWith(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,reportStyle: freezed == reportStyle ? _self.reportStyle : reportStyle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnhancePromptRequest].
extension EnhancePromptRequestPatterns on EnhancePromptRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnhancePromptRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnhancePromptRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnhancePromptRequest value)  $default,){
final _that = this;
switch (_that) {
case _EnhancePromptRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnhancePromptRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EnhancePromptRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String prompt,  String? context, @JsonKey(name: 'report_style')  String? reportStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnhancePromptRequest() when $default != null:
return $default(_that.prompt,_that.context,_that.reportStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String prompt,  String? context, @JsonKey(name: 'report_style')  String? reportStyle)  $default,) {final _that = this;
switch (_that) {
case _EnhancePromptRequest():
return $default(_that.prompt,_that.context,_that.reportStyle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String prompt,  String? context, @JsonKey(name: 'report_style')  String? reportStyle)?  $default,) {final _that = this;
switch (_that) {
case _EnhancePromptRequest() when $default != null:
return $default(_that.prompt,_that.context,_that.reportStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EnhancePromptRequest implements EnhancePromptRequest {
  const _EnhancePromptRequest({required this.prompt, this.context = '', @JsonKey(name: 'report_style') this.reportStyle = 'academic'});
  factory _EnhancePromptRequest.fromJson(Map<String, dynamic> json) => _$EnhancePromptRequestFromJson(json);

@override final  String prompt;
@override@JsonKey() final  String? context;
@override@JsonKey(name: 'report_style') final  String? reportStyle;

/// Create a copy of EnhancePromptRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnhancePromptRequestCopyWith<_EnhancePromptRequest> get copyWith => __$EnhancePromptRequestCopyWithImpl<_EnhancePromptRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnhancePromptRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnhancePromptRequest&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.context, context) || other.context == context)&&(identical(other.reportStyle, reportStyle) || other.reportStyle == reportStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prompt,context,reportStyle);

@override
String toString() {
  return 'EnhancePromptRequest(prompt: $prompt, context: $context, reportStyle: $reportStyle)';
}


}

/// @nodoc
abstract mixin class _$EnhancePromptRequestCopyWith<$Res> implements $EnhancePromptRequestCopyWith<$Res> {
  factory _$EnhancePromptRequestCopyWith(_EnhancePromptRequest value, $Res Function(_EnhancePromptRequest) _then) = __$EnhancePromptRequestCopyWithImpl;
@override @useResult
$Res call({
 String prompt, String? context,@JsonKey(name: 'report_style') String? reportStyle
});




}
/// @nodoc
class __$EnhancePromptRequestCopyWithImpl<$Res>
    implements _$EnhancePromptRequestCopyWith<$Res> {
  __$EnhancePromptRequestCopyWithImpl(this._self, this._then);

  final _EnhancePromptRequest _self;
  final $Res Function(_EnhancePromptRequest) _then;

/// Create a copy of EnhancePromptRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prompt = null,Object? context = freezed,Object? reportStyle = freezed,}) {
  return _then(_EnhancePromptRequest(
prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,reportStyle: freezed == reportStyle ? _self.reportStyle : reportStyle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RAGConfigResponse {

 String? get provider;
/// Create a copy of RAGConfigResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RAGConfigResponseCopyWith<RAGConfigResponse> get copyWith => _$RAGConfigResponseCopyWithImpl<RAGConfigResponse>(this as RAGConfigResponse, _$identity);

  /// Serializes this RAGConfigResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RAGConfigResponse&&(identical(other.provider, provider) || other.provider == provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider);

@override
String toString() {
  return 'RAGConfigResponse(provider: $provider)';
}


}

/// @nodoc
abstract mixin class $RAGConfigResponseCopyWith<$Res>  {
  factory $RAGConfigResponseCopyWith(RAGConfigResponse value, $Res Function(RAGConfigResponse) _then) = _$RAGConfigResponseCopyWithImpl;
@useResult
$Res call({
 String? provider
});




}
/// @nodoc
class _$RAGConfigResponseCopyWithImpl<$Res>
    implements $RAGConfigResponseCopyWith<$Res> {
  _$RAGConfigResponseCopyWithImpl(this._self, this._then);

  final RAGConfigResponse _self;
  final $Res Function(RAGConfigResponse) _then;

/// Create a copy of RAGConfigResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = freezed,}) {
  return _then(_self.copyWith(
provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RAGConfigResponse].
extension RAGConfigResponsePatterns on RAGConfigResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RAGConfigResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RAGConfigResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RAGConfigResponse value)  $default,){
final _that = this;
switch (_that) {
case _RAGConfigResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RAGConfigResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RAGConfigResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? provider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RAGConfigResponse() when $default != null:
return $default(_that.provider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? provider)  $default,) {final _that = this;
switch (_that) {
case _RAGConfigResponse():
return $default(_that.provider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? provider)?  $default,) {final _that = this;
switch (_that) {
case _RAGConfigResponse() when $default != null:
return $default(_that.provider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RAGConfigResponse implements RAGConfigResponse {
  const _RAGConfigResponse({this.provider});
  factory _RAGConfigResponse.fromJson(Map<String, dynamic> json) => _$RAGConfigResponseFromJson(json);

@override final  String? provider;

/// Create a copy of RAGConfigResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RAGConfigResponseCopyWith<_RAGConfigResponse> get copyWith => __$RAGConfigResponseCopyWithImpl<_RAGConfigResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RAGConfigResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RAGConfigResponse&&(identical(other.provider, provider) || other.provider == provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider);

@override
String toString() {
  return 'RAGConfigResponse(provider: $provider)';
}


}

/// @nodoc
abstract mixin class _$RAGConfigResponseCopyWith<$Res> implements $RAGConfigResponseCopyWith<$Res> {
  factory _$RAGConfigResponseCopyWith(_RAGConfigResponse value, $Res Function(_RAGConfigResponse) _then) = __$RAGConfigResponseCopyWithImpl;
@override @useResult
$Res call({
 String? provider
});




}
/// @nodoc
class __$RAGConfigResponseCopyWithImpl<$Res>
    implements _$RAGConfigResponseCopyWith<$Res> {
  __$RAGConfigResponseCopyWithImpl(this._self, this._then);

  final _RAGConfigResponse _self;
  final $Res Function(_RAGConfigResponse) _then;

/// Create a copy of RAGConfigResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = freezed,}) {
  return _then(_RAGConfigResponse(
provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ConfigResponse {

 RAGConfigResponse get rag; Map<String, List<String>> get models;
/// Create a copy of ConfigResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigResponseCopyWith<ConfigResponse> get copyWith => _$ConfigResponseCopyWithImpl<ConfigResponse>(this as ConfigResponse, _$identity);

  /// Serializes this ConfigResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigResponse&&(identical(other.rag, rag) || other.rag == rag)&&const DeepCollectionEquality().equals(other.models, models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rag,const DeepCollectionEquality().hash(models));

@override
String toString() {
  return 'ConfigResponse(rag: $rag, models: $models)';
}


}

/// @nodoc
abstract mixin class $ConfigResponseCopyWith<$Res>  {
  factory $ConfigResponseCopyWith(ConfigResponse value, $Res Function(ConfigResponse) _then) = _$ConfigResponseCopyWithImpl;
@useResult
$Res call({
 RAGConfigResponse rag, Map<String, List<String>> models
});


$RAGConfigResponseCopyWith<$Res> get rag;

}
/// @nodoc
class _$ConfigResponseCopyWithImpl<$Res>
    implements $ConfigResponseCopyWith<$Res> {
  _$ConfigResponseCopyWithImpl(this._self, this._then);

  final ConfigResponse _self;
  final $Res Function(ConfigResponse) _then;

/// Create a copy of ConfigResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rag = null,Object? models = null,}) {
  return _then(_self.copyWith(
rag: null == rag ? _self.rag : rag // ignore: cast_nullable_to_non_nullable
as RAGConfigResponse,models: null == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}
/// Create a copy of ConfigResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RAGConfigResponseCopyWith<$Res> get rag {
  
  return $RAGConfigResponseCopyWith<$Res>(_self.rag, (value) {
    return _then(_self.copyWith(rag: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConfigResponse].
extension ConfigResponsePatterns on ConfigResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConfigResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RAGConfigResponse rag,  Map<String, List<String>> models)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigResponse() when $default != null:
return $default(_that.rag,_that.models);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RAGConfigResponse rag,  Map<String, List<String>> models)  $default,) {final _that = this;
switch (_that) {
case _ConfigResponse():
return $default(_that.rag,_that.models);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RAGConfigResponse rag,  Map<String, List<String>> models)?  $default,) {final _that = this;
switch (_that) {
case _ConfigResponse() when $default != null:
return $default(_that.rag,_that.models);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfigResponse implements ConfigResponse {
  const _ConfigResponse({required this.rag, required final  Map<String, List<String>> models}): _models = models;
  factory _ConfigResponse.fromJson(Map<String, dynamic> json) => _$ConfigResponseFromJson(json);

@override final  RAGConfigResponse rag;
 final  Map<String, List<String>> _models;
@override Map<String, List<String>> get models {
  if (_models is EqualUnmodifiableMapView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_models);
}


/// Create a copy of ConfigResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigResponseCopyWith<_ConfigResponse> get copyWith => __$ConfigResponseCopyWithImpl<_ConfigResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigResponse&&(identical(other.rag, rag) || other.rag == rag)&&const DeepCollectionEquality().equals(other._models, _models));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rag,const DeepCollectionEquality().hash(_models));

@override
String toString() {
  return 'ConfigResponse(rag: $rag, models: $models)';
}


}

/// @nodoc
abstract mixin class _$ConfigResponseCopyWith<$Res> implements $ConfigResponseCopyWith<$Res> {
  factory _$ConfigResponseCopyWith(_ConfigResponse value, $Res Function(_ConfigResponse) _then) = __$ConfigResponseCopyWithImpl;
@override @useResult
$Res call({
 RAGConfigResponse rag, Map<String, List<String>> models
});


@override $RAGConfigResponseCopyWith<$Res> get rag;

}
/// @nodoc
class __$ConfigResponseCopyWithImpl<$Res>
    implements _$ConfigResponseCopyWith<$Res> {
  __$ConfigResponseCopyWithImpl(this._self, this._then);

  final _ConfigResponse _self;
  final $Res Function(_ConfigResponse) _then;

/// Create a copy of ConfigResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rag = null,Object? models = null,}) {
  return _then(_ConfigResponse(
rag: null == rag ? _self.rag : rag // ignore: cast_nullable_to_non_nullable
as RAGConfigResponse,models: null == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

/// Create a copy of ConfigResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RAGConfigResponseCopyWith<$Res> get rag {
  
  return $RAGConfigResponseCopyWith<$Res>(_self.rag, (value) {
    return _then(_self.copyWith(rag: value));
  });
}
}


/// @nodoc
mixin _$RAGResourcesResponse {

 List<Resource> get resources;
/// Create a copy of RAGResourcesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RAGResourcesResponseCopyWith<RAGResourcesResponse> get copyWith => _$RAGResourcesResponseCopyWithImpl<RAGResourcesResponse>(this as RAGResourcesResponse, _$identity);

  /// Serializes this RAGResourcesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RAGResourcesResponse&&const DeepCollectionEquality().equals(other.resources, resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(resources));

@override
String toString() {
  return 'RAGResourcesResponse(resources: $resources)';
}


}

/// @nodoc
abstract mixin class $RAGResourcesResponseCopyWith<$Res>  {
  factory $RAGResourcesResponseCopyWith(RAGResourcesResponse value, $Res Function(RAGResourcesResponse) _then) = _$RAGResourcesResponseCopyWithImpl;
@useResult
$Res call({
 List<Resource> resources
});




}
/// @nodoc
class _$RAGResourcesResponseCopyWithImpl<$Res>
    implements $RAGResourcesResponseCopyWith<$Res> {
  _$RAGResourcesResponseCopyWithImpl(this._self, this._then);

  final RAGResourcesResponse _self;
  final $Res Function(RAGResourcesResponse) _then;

/// Create a copy of RAGResourcesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resources = null,}) {
  return _then(_self.copyWith(
resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<Resource>,
  ));
}

}


/// Adds pattern-matching-related methods to [RAGResourcesResponse].
extension RAGResourcesResponsePatterns on RAGResourcesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RAGResourcesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RAGResourcesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RAGResourcesResponse value)  $default,){
final _that = this;
switch (_that) {
case _RAGResourcesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RAGResourcesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RAGResourcesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Resource> resources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RAGResourcesResponse() when $default != null:
return $default(_that.resources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Resource> resources)  $default,) {final _that = this;
switch (_that) {
case _RAGResourcesResponse():
return $default(_that.resources);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Resource> resources)?  $default,) {final _that = this;
switch (_that) {
case _RAGResourcesResponse() when $default != null:
return $default(_that.resources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RAGResourcesResponse implements RAGResourcesResponse {
  const _RAGResourcesResponse({required final  List<Resource> resources}): _resources = resources;
  factory _RAGResourcesResponse.fromJson(Map<String, dynamic> json) => _$RAGResourcesResponseFromJson(json);

 final  List<Resource> _resources;
@override List<Resource> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}


/// Create a copy of RAGResourcesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RAGResourcesResponseCopyWith<_RAGResourcesResponse> get copyWith => __$RAGResourcesResponseCopyWithImpl<_RAGResourcesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RAGResourcesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RAGResourcesResponse&&const DeepCollectionEquality().equals(other._resources, _resources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_resources));

@override
String toString() {
  return 'RAGResourcesResponse(resources: $resources)';
}


}

/// @nodoc
abstract mixin class _$RAGResourcesResponseCopyWith<$Res> implements $RAGResourcesResponseCopyWith<$Res> {
  factory _$RAGResourcesResponseCopyWith(_RAGResourcesResponse value, $Res Function(_RAGResourcesResponse) _then) = __$RAGResourcesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Resource> resources
});




}
/// @nodoc
class __$RAGResourcesResponseCopyWithImpl<$Res>
    implements _$RAGResourcesResponseCopyWith<$Res> {
  __$RAGResourcesResponseCopyWithImpl(this._self, this._then);

  final _RAGResourcesResponse _self;
  final $Res Function(_RAGResourcesResponse) _then;

/// Create a copy of RAGResourcesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resources = null,}) {
  return _then(_RAGResourcesResponse(
resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<Resource>,
  ));
}


}


/// @nodoc
mixin _$MCPServerMetadataRequest {

 String get transport; String? get command; List<String>? get args; String? get url; Map<String, String>? get env; Map<String, String>? get headers;@JsonKey(name: 'timeout_seconds') int? get timeoutSeconds;
/// Create a copy of MCPServerMetadataRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MCPServerMetadataRequestCopyWith<MCPServerMetadataRequest> get copyWith => _$MCPServerMetadataRequestCopyWithImpl<MCPServerMetadataRequest>(this as MCPServerMetadataRequest, _$identity);

  /// Serializes this MCPServerMetadataRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MCPServerMetadataRequest&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other.args, args)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.env, env)&&const DeepCollectionEquality().equals(other.headers, headers)&&(identical(other.timeoutSeconds, timeoutSeconds) || other.timeoutSeconds == timeoutSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transport,command,const DeepCollectionEquality().hash(args),url,const DeepCollectionEquality().hash(env),const DeepCollectionEquality().hash(headers),timeoutSeconds);

@override
String toString() {
  return 'MCPServerMetadataRequest(transport: $transport, command: $command, args: $args, url: $url, env: $env, headers: $headers, timeoutSeconds: $timeoutSeconds)';
}


}

/// @nodoc
abstract mixin class $MCPServerMetadataRequestCopyWith<$Res>  {
  factory $MCPServerMetadataRequestCopyWith(MCPServerMetadataRequest value, $Res Function(MCPServerMetadataRequest) _then) = _$MCPServerMetadataRequestCopyWithImpl;
@useResult
$Res call({
 String transport, String? command, List<String>? args, String? url, Map<String, String>? env, Map<String, String>? headers,@JsonKey(name: 'timeout_seconds') int? timeoutSeconds
});




}
/// @nodoc
class _$MCPServerMetadataRequestCopyWithImpl<$Res>
    implements $MCPServerMetadataRequestCopyWith<$Res> {
  _$MCPServerMetadataRequestCopyWithImpl(this._self, this._then);

  final MCPServerMetadataRequest _self;
  final $Res Function(MCPServerMetadataRequest) _then;

/// Create a copy of MCPServerMetadataRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transport = null,Object? command = freezed,Object? args = freezed,Object? url = freezed,Object? env = freezed,Object? headers = freezed,Object? timeoutSeconds = freezed,}) {
  return _then(_self.copyWith(
transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as String,command: freezed == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String?,args: freezed == args ? _self.args : args // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,env: freezed == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,timeoutSeconds: freezed == timeoutSeconds ? _self.timeoutSeconds : timeoutSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MCPServerMetadataRequest].
extension MCPServerMetadataRequestPatterns on MCPServerMetadataRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MCPServerMetadataRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MCPServerMetadataRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MCPServerMetadataRequest value)  $default,){
final _that = this;
switch (_that) {
case _MCPServerMetadataRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MCPServerMetadataRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MCPServerMetadataRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transport,  String? command,  List<String>? args,  String? url,  Map<String, String>? env,  Map<String, String>? headers, @JsonKey(name: 'timeout_seconds')  int? timeoutSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MCPServerMetadataRequest() when $default != null:
return $default(_that.transport,_that.command,_that.args,_that.url,_that.env,_that.headers,_that.timeoutSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transport,  String? command,  List<String>? args,  String? url,  Map<String, String>? env,  Map<String, String>? headers, @JsonKey(name: 'timeout_seconds')  int? timeoutSeconds)  $default,) {final _that = this;
switch (_that) {
case _MCPServerMetadataRequest():
return $default(_that.transport,_that.command,_that.args,_that.url,_that.env,_that.headers,_that.timeoutSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transport,  String? command,  List<String>? args,  String? url,  Map<String, String>? env,  Map<String, String>? headers, @JsonKey(name: 'timeout_seconds')  int? timeoutSeconds)?  $default,) {final _that = this;
switch (_that) {
case _MCPServerMetadataRequest() when $default != null:
return $default(_that.transport,_that.command,_that.args,_that.url,_that.env,_that.headers,_that.timeoutSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MCPServerMetadataRequest implements MCPServerMetadataRequest {
  const _MCPServerMetadataRequest({required this.transport, this.command, final  List<String>? args, this.url, final  Map<String, String>? env, final  Map<String, String>? headers, @JsonKey(name: 'timeout_seconds') this.timeoutSeconds}): _args = args,_env = env,_headers = headers;
  factory _MCPServerMetadataRequest.fromJson(Map<String, dynamic> json) => _$MCPServerMetadataRequestFromJson(json);

@override final  String transport;
@override final  String? command;
 final  List<String>? _args;
@override List<String>? get args {
  final value = _args;
  if (value == null) return null;
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? url;
 final  Map<String, String>? _env;
@override Map<String, String>? get env {
  final value = _env;
  if (value == null) return null;
  if (_env is EqualUnmodifiableMapView) return _env;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, String>? _headers;
@override Map<String, String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'timeout_seconds') final  int? timeoutSeconds;

/// Create a copy of MCPServerMetadataRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MCPServerMetadataRequestCopyWith<_MCPServerMetadataRequest> get copyWith => __$MCPServerMetadataRequestCopyWithImpl<_MCPServerMetadataRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MCPServerMetadataRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MCPServerMetadataRequest&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other._args, _args)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._env, _env)&&const DeepCollectionEquality().equals(other._headers, _headers)&&(identical(other.timeoutSeconds, timeoutSeconds) || other.timeoutSeconds == timeoutSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transport,command,const DeepCollectionEquality().hash(_args),url,const DeepCollectionEquality().hash(_env),const DeepCollectionEquality().hash(_headers),timeoutSeconds);

@override
String toString() {
  return 'MCPServerMetadataRequest(transport: $transport, command: $command, args: $args, url: $url, env: $env, headers: $headers, timeoutSeconds: $timeoutSeconds)';
}


}

/// @nodoc
abstract mixin class _$MCPServerMetadataRequestCopyWith<$Res> implements $MCPServerMetadataRequestCopyWith<$Res> {
  factory _$MCPServerMetadataRequestCopyWith(_MCPServerMetadataRequest value, $Res Function(_MCPServerMetadataRequest) _then) = __$MCPServerMetadataRequestCopyWithImpl;
@override @useResult
$Res call({
 String transport, String? command, List<String>? args, String? url, Map<String, String>? env, Map<String, String>? headers,@JsonKey(name: 'timeout_seconds') int? timeoutSeconds
});




}
/// @nodoc
class __$MCPServerMetadataRequestCopyWithImpl<$Res>
    implements _$MCPServerMetadataRequestCopyWith<$Res> {
  __$MCPServerMetadataRequestCopyWithImpl(this._self, this._then);

  final _MCPServerMetadataRequest _self;
  final $Res Function(_MCPServerMetadataRequest) _then;

/// Create a copy of MCPServerMetadataRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transport = null,Object? command = freezed,Object? args = freezed,Object? url = freezed,Object? env = freezed,Object? headers = freezed,Object? timeoutSeconds = freezed,}) {
  return _then(_MCPServerMetadataRequest(
transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as String,command: freezed == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String?,args: freezed == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,env: freezed == env ? _self._env : env // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,timeoutSeconds: freezed == timeoutSeconds ? _self.timeoutSeconds : timeoutSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MCPServerMetadataResponse {

 String get transport; String? get command; List<String>? get args; String? get url; Map<String, String>? get env; Map<String, String>? get headers; List<dynamic>? get tools;
/// Create a copy of MCPServerMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MCPServerMetadataResponseCopyWith<MCPServerMetadataResponse> get copyWith => _$MCPServerMetadataResponseCopyWithImpl<MCPServerMetadataResponse>(this as MCPServerMetadataResponse, _$identity);

  /// Serializes this MCPServerMetadataResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MCPServerMetadataResponse&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other.args, args)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.env, env)&&const DeepCollectionEquality().equals(other.headers, headers)&&const DeepCollectionEquality().equals(other.tools, tools));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transport,command,const DeepCollectionEquality().hash(args),url,const DeepCollectionEquality().hash(env),const DeepCollectionEquality().hash(headers),const DeepCollectionEquality().hash(tools));

@override
String toString() {
  return 'MCPServerMetadataResponse(transport: $transport, command: $command, args: $args, url: $url, env: $env, headers: $headers, tools: $tools)';
}


}

/// @nodoc
abstract mixin class $MCPServerMetadataResponseCopyWith<$Res>  {
  factory $MCPServerMetadataResponseCopyWith(MCPServerMetadataResponse value, $Res Function(MCPServerMetadataResponse) _then) = _$MCPServerMetadataResponseCopyWithImpl;
@useResult
$Res call({
 String transport, String? command, List<String>? args, String? url, Map<String, String>? env, Map<String, String>? headers, List<dynamic>? tools
});




}
/// @nodoc
class _$MCPServerMetadataResponseCopyWithImpl<$Res>
    implements $MCPServerMetadataResponseCopyWith<$Res> {
  _$MCPServerMetadataResponseCopyWithImpl(this._self, this._then);

  final MCPServerMetadataResponse _self;
  final $Res Function(MCPServerMetadataResponse) _then;

/// Create a copy of MCPServerMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transport = null,Object? command = freezed,Object? args = freezed,Object? url = freezed,Object? env = freezed,Object? headers = freezed,Object? tools = freezed,}) {
  return _then(_self.copyWith(
transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as String,command: freezed == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String?,args: freezed == args ? _self.args : args // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,env: freezed == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,tools: freezed == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MCPServerMetadataResponse].
extension MCPServerMetadataResponsePatterns on MCPServerMetadataResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MCPServerMetadataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MCPServerMetadataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MCPServerMetadataResponse value)  $default,){
final _that = this;
switch (_that) {
case _MCPServerMetadataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MCPServerMetadataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MCPServerMetadataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transport,  String? command,  List<String>? args,  String? url,  Map<String, String>? env,  Map<String, String>? headers,  List<dynamic>? tools)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MCPServerMetadataResponse() when $default != null:
return $default(_that.transport,_that.command,_that.args,_that.url,_that.env,_that.headers,_that.tools);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transport,  String? command,  List<String>? args,  String? url,  Map<String, String>? env,  Map<String, String>? headers,  List<dynamic>? tools)  $default,) {final _that = this;
switch (_that) {
case _MCPServerMetadataResponse():
return $default(_that.transport,_that.command,_that.args,_that.url,_that.env,_that.headers,_that.tools);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transport,  String? command,  List<String>? args,  String? url,  Map<String, String>? env,  Map<String, String>? headers,  List<dynamic>? tools)?  $default,) {final _that = this;
switch (_that) {
case _MCPServerMetadataResponse() when $default != null:
return $default(_that.transport,_that.command,_that.args,_that.url,_that.env,_that.headers,_that.tools);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MCPServerMetadataResponse implements MCPServerMetadataResponse {
  const _MCPServerMetadataResponse({required this.transport, this.command, final  List<String>? args, this.url, final  Map<String, String>? env, final  Map<String, String>? headers, final  List<dynamic>? tools}): _args = args,_env = env,_headers = headers,_tools = tools;
  factory _MCPServerMetadataResponse.fromJson(Map<String, dynamic> json) => _$MCPServerMetadataResponseFromJson(json);

@override final  String transport;
@override final  String? command;
 final  List<String>? _args;
@override List<String>? get args {
  final value = _args;
  if (value == null) return null;
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? url;
 final  Map<String, String>? _env;
@override Map<String, String>? get env {
  final value = _env;
  if (value == null) return null;
  if (_env is EqualUnmodifiableMapView) return _env;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, String>? _headers;
@override Map<String, String>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<dynamic>? _tools;
@override List<dynamic>? get tools {
  final value = _tools;
  if (value == null) return null;
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MCPServerMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MCPServerMetadataResponseCopyWith<_MCPServerMetadataResponse> get copyWith => __$MCPServerMetadataResponseCopyWithImpl<_MCPServerMetadataResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MCPServerMetadataResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MCPServerMetadataResponse&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other._args, _args)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._env, _env)&&const DeepCollectionEquality().equals(other._headers, _headers)&&const DeepCollectionEquality().equals(other._tools, _tools));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transport,command,const DeepCollectionEquality().hash(_args),url,const DeepCollectionEquality().hash(_env),const DeepCollectionEquality().hash(_headers),const DeepCollectionEquality().hash(_tools));

@override
String toString() {
  return 'MCPServerMetadataResponse(transport: $transport, command: $command, args: $args, url: $url, env: $env, headers: $headers, tools: $tools)';
}


}

/// @nodoc
abstract mixin class _$MCPServerMetadataResponseCopyWith<$Res> implements $MCPServerMetadataResponseCopyWith<$Res> {
  factory _$MCPServerMetadataResponseCopyWith(_MCPServerMetadataResponse value, $Res Function(_MCPServerMetadataResponse) _then) = __$MCPServerMetadataResponseCopyWithImpl;
@override @useResult
$Res call({
 String transport, String? command, List<String>? args, String? url, Map<String, String>? env, Map<String, String>? headers, List<dynamic>? tools
});




}
/// @nodoc
class __$MCPServerMetadataResponseCopyWithImpl<$Res>
    implements _$MCPServerMetadataResponseCopyWith<$Res> {
  __$MCPServerMetadataResponseCopyWithImpl(this._self, this._then);

  final _MCPServerMetadataResponse _self;
  final $Res Function(_MCPServerMetadataResponse) _then;

/// Create a copy of MCPServerMetadataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transport = null,Object? command = freezed,Object? args = freezed,Object? url = freezed,Object? env = freezed,Object? headers = freezed,Object? tools = freezed,}) {
  return _then(_MCPServerMetadataResponse(
transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as String,command: freezed == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String?,args: freezed == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<String>?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,env: freezed == env ? _self._env : env // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,tools: freezed == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
