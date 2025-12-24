// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsState {
  List<ArticleListItem> get articles;
  List<TopicItem> get categories;
  bool get isLoading;
  bool get isLoadingMore;
  bool get hasMore;
  String? get error;
  String? get selectedCategoryId;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsStateCopyWith<NewsState> get copyWith =>
      _$NewsStateCopyWithImpl<NewsState>(this as NewsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsState &&
            const DeepCollectionEquality().equals(other.articles, articles) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articles),
      const DeepCollectionEquality().hash(categories),
      isLoading,
      isLoadingMore,
      hasMore,
      error,
      selectedCategoryId);

  @override
  String toString() {
    return 'NewsState(articles: $articles, categories: $categories, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error, selectedCategoryId: $selectedCategoryId)';
  }
}

/// @nodoc
abstract mixin class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) _then) =
      _$NewsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ArticleListItem> articles,
      List<TopicItem> categories,
      bool isLoading,
      bool isLoadingMore,
      bool hasMore,
      String? error,
      String? selectedCategoryId});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._self, this._then);

  final NewsState _self;
  final $Res Function(NewsState) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? categories = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? selectedCategoryId = freezed,
  }) {
    return _then(_self.copyWith(
      articles: null == articles
          ? _self.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleListItem>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TopicItem>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategoryId: freezed == selectedCategoryId
          ? _self.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NewsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NewsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NewsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ArticleListItem> articles,
            List<TopicItem> categories,
            bool isLoading,
            bool isLoadingMore,
            bool hasMore,
            String? error,
            String? selectedCategoryId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
        return $default(
            _that.articles,
            _that.categories,
            _that.isLoading,
            _that.isLoadingMore,
            _that.hasMore,
            _that.error,
            _that.selectedCategoryId);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ArticleListItem> articles,
            List<TopicItem> categories,
            bool isLoading,
            bool isLoadingMore,
            bool hasMore,
            String? error,
            String? selectedCategoryId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState():
        return $default(
            _that.articles,
            _that.categories,
            _that.isLoading,
            _that.isLoadingMore,
            _that.hasMore,
            _that.error,
            _that.selectedCategoryId);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ArticleListItem> articles,
            List<TopicItem> categories,
            bool isLoading,
            bool isLoadingMore,
            bool hasMore,
            String? error,
            String? selectedCategoryId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsState() when $default != null:
        return $default(
            _that.articles,
            _that.categories,
            _that.isLoading,
            _that.isLoadingMore,
            _that.hasMore,
            _that.error,
            _that.selectedCategoryId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewsState implements NewsState {
  const _NewsState(
      {final List<ArticleListItem> articles = const [],
      final List<TopicItem> categories = const [],
      this.isLoading = false,
      this.isLoadingMore = false,
      this.hasMore = true,
      this.error,
      this.selectedCategoryId})
      : _articles = articles,
        _categories = categories;

  final List<ArticleListItem> _articles;
  @override
  @JsonKey()
  List<ArticleListItem> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  final List<TopicItem> _categories;
  @override
  @JsonKey()
  List<TopicItem> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final String? error;
  @override
  final String? selectedCategoryId;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsStateCopyWith<_NewsState> get copyWith =>
      __$NewsStateCopyWithImpl<_NewsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsState &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_articles),
      const DeepCollectionEquality().hash(_categories),
      isLoading,
      isLoadingMore,
      hasMore,
      error,
      selectedCategoryId);

  @override
  String toString() {
    return 'NewsState(articles: $articles, categories: $categories, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, error: $error, selectedCategoryId: $selectedCategoryId)';
  }
}

/// @nodoc
abstract mixin class _$NewsStateCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$NewsStateCopyWith(
          _NewsState value, $Res Function(_NewsState) _then) =
      __$NewsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ArticleListItem> articles,
      List<TopicItem> categories,
      bool isLoading,
      bool isLoadingMore,
      bool hasMore,
      String? error,
      String? selectedCategoryId});
}

/// @nodoc
class __$NewsStateCopyWithImpl<$Res> implements _$NewsStateCopyWith<$Res> {
  __$NewsStateCopyWithImpl(this._self, this._then);

  final _NewsState _self;
  final $Res Function(_NewsState) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? articles = null,
    Object? categories = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? selectedCategoryId = freezed,
  }) {
    return _then(_NewsState(
      articles: null == articles
          ? _self._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleListItem>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TopicItem>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _self.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCategoryId: freezed == selectedCategoryId
          ? _self.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
