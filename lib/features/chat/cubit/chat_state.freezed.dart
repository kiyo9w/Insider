// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatState {
  String get currentResponse;
  bool get responseStarted;
  bool get isSearching;
  List<String> get searchQueries;
  bool get isReading;
  int get readingCount;
  int get sourcesCount;
  List<String> get relatedQuestions;
  String? get error;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatStateCopyWith<ChatState> get copyWith =>
      _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatState &&
            (identical(other.currentResponse, currentResponse) ||
                other.currentResponse == currentResponse) &&
            (identical(other.responseStarted, responseStarted) ||
                other.responseStarted == responseStarted) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other.searchQueries, searchQueries) &&
            (identical(other.isReading, isReading) ||
                other.isReading == isReading) &&
            (identical(other.readingCount, readingCount) ||
                other.readingCount == readingCount) &&
            (identical(other.sourcesCount, sourcesCount) ||
                other.sourcesCount == sourcesCount) &&
            const DeepCollectionEquality()
                .equals(other.relatedQuestions, relatedQuestions) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentResponse,
      responseStarted,
      isSearching,
      const DeepCollectionEquality().hash(searchQueries),
      isReading,
      readingCount,
      sourcesCount,
      const DeepCollectionEquality().hash(relatedQuestions),
      error);

  @override
  String toString() {
    return 'ChatState(currentResponse: $currentResponse, responseStarted: $responseStarted, isSearching: $isSearching, searchQueries: $searchQueries, isReading: $isReading, readingCount: $readingCount, sourcesCount: $sourcesCount, relatedQuestions: $relatedQuestions, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) =
      _$ChatStateCopyWithImpl;
  @useResult
  $Res call(
      {String currentResponse,
      bool responseStarted,
      bool isSearching,
      List<String> searchQueries,
      bool isReading,
      int readingCount,
      int sourcesCount,
      List<String> relatedQuestions,
      String? error});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentResponse = null,
    Object? responseStarted = null,
    Object? isSearching = null,
    Object? searchQueries = null,
    Object? isReading = null,
    Object? readingCount = null,
    Object? sourcesCount = null,
    Object? relatedQuestions = null,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      currentResponse: null == currentResponse
          ? _self.currentResponse
          : currentResponse // ignore: cast_nullable_to_non_nullable
              as String,
      responseStarted: null == responseStarted
          ? _self.responseStarted
          : responseStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQueries: null == searchQueries
          ? _self.searchQueries
          : searchQueries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReading: null == isReading
          ? _self.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as bool,
      readingCount: null == readingCount
          ? _self.readingCount
          : readingCount // ignore: cast_nullable_to_non_nullable
              as int,
      sourcesCount: null == sourcesCount
          ? _self.sourcesCount
          : sourcesCount // ignore: cast_nullable_to_non_nullable
              as int,
      relatedQuestions: null == relatedQuestions
          ? _self.relatedQuestions
          : relatedQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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
    TResult Function(_ChatState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
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
    TResult Function(_ChatState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState():
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
    TResult? Function(_ChatState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
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
            String currentResponse,
            bool responseStarted,
            bool isSearching,
            List<String> searchQueries,
            bool isReading,
            int readingCount,
            int sourcesCount,
            List<String> relatedQuestions,
            String? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
        return $default(
            _that.currentResponse,
            _that.responseStarted,
            _that.isSearching,
            _that.searchQueries,
            _that.isReading,
            _that.readingCount,
            _that.sourcesCount,
            _that.relatedQuestions,
            _that.error);
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
            String currentResponse,
            bool responseStarted,
            bool isSearching,
            List<String> searchQueries,
            bool isReading,
            int readingCount,
            int sourcesCount,
            List<String> relatedQuestions,
            String? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState():
        return $default(
            _that.currentResponse,
            _that.responseStarted,
            _that.isSearching,
            _that.searchQueries,
            _that.isReading,
            _that.readingCount,
            _that.sourcesCount,
            _that.relatedQuestions,
            _that.error);
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
            String currentResponse,
            bool responseStarted,
            bool isSearching,
            List<String> searchQueries,
            bool isReading,
            int readingCount,
            int sourcesCount,
            List<String> relatedQuestions,
            String? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatState() when $default != null:
        return $default(
            _that.currentResponse,
            _that.responseStarted,
            _that.isSearching,
            _that.searchQueries,
            _that.isReading,
            _that.readingCount,
            _that.sourcesCount,
            _that.relatedQuestions,
            _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChatState implements ChatState {
  const _ChatState(
      {this.currentResponse = '',
      this.responseStarted = false,
      this.isSearching = false,
      final List<String> searchQueries = const [],
      this.isReading = false,
      this.readingCount = 0,
      this.sourcesCount = 0,
      final List<String> relatedQuestions = const [],
      this.error})
      : _searchQueries = searchQueries,
        _relatedQuestions = relatedQuestions;

  @override
  @JsonKey()
  final String currentResponse;
  @override
  @JsonKey()
  final bool responseStarted;
  @override
  @JsonKey()
  final bool isSearching;
  final List<String> _searchQueries;
  @override
  @JsonKey()
  List<String> get searchQueries {
    if (_searchQueries is EqualUnmodifiableListView) return _searchQueries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchQueries);
  }

  @override
  @JsonKey()
  final bool isReading;
  @override
  @JsonKey()
  final int readingCount;
  @override
  @JsonKey()
  final int sourcesCount;
  final List<String> _relatedQuestions;
  @override
  @JsonKey()
  List<String> get relatedQuestions {
    if (_relatedQuestions is EqualUnmodifiableListView)
      return _relatedQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedQuestions);
  }

  @override
  final String? error;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            (identical(other.currentResponse, currentResponse) ||
                other.currentResponse == currentResponse) &&
            (identical(other.responseStarted, responseStarted) ||
                other.responseStarted == responseStarted) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._searchQueries, _searchQueries) &&
            (identical(other.isReading, isReading) ||
                other.isReading == isReading) &&
            (identical(other.readingCount, readingCount) ||
                other.readingCount == readingCount) &&
            (identical(other.sourcesCount, sourcesCount) ||
                other.sourcesCount == sourcesCount) &&
            const DeepCollectionEquality()
                .equals(other._relatedQuestions, _relatedQuestions) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentResponse,
      responseStarted,
      isSearching,
      const DeepCollectionEquality().hash(_searchQueries),
      isReading,
      readingCount,
      sourcesCount,
      const DeepCollectionEquality().hash(_relatedQuestions),
      error);

  @override
  String toString() {
    return 'ChatState(currentResponse: $currentResponse, responseStarted: $responseStarted, isSearching: $isSearching, searchQueries: $searchQueries, isReading: $isReading, readingCount: $readingCount, sourcesCount: $sourcesCount, relatedQuestions: $relatedQuestions, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) _then) =
      __$ChatStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String currentResponse,
      bool responseStarted,
      bool isSearching,
      List<String> searchQueries,
      bool isReading,
      int readingCount,
      int sourcesCount,
      List<String> relatedQuestions,
      String? error});
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentResponse = null,
    Object? responseStarted = null,
    Object? isSearching = null,
    Object? searchQueries = null,
    Object? isReading = null,
    Object? readingCount = null,
    Object? sourcesCount = null,
    Object? relatedQuestions = null,
    Object? error = freezed,
  }) {
    return _then(_ChatState(
      currentResponse: null == currentResponse
          ? _self.currentResponse
          : currentResponse // ignore: cast_nullable_to_non_nullable
              as String,
      responseStarted: null == responseStarted
          ? _self.responseStarted
          : responseStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _self.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQueries: null == searchQueries
          ? _self._searchQueries
          : searchQueries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isReading: null == isReading
          ? _self.isReading
          : isReading // ignore: cast_nullable_to_non_nullable
              as bool,
      readingCount: null == readingCount
          ? _self.readingCount
          : readingCount // ignore: cast_nullable_to_non_nullable
              as int,
      sourcesCount: null == sourcesCount
          ? _self.sourcesCount
          : sourcesCount // ignore: cast_nullable_to_non_nullable
              as int,
      relatedQuestions: null == relatedQuestions
          ? _self._relatedQuestions
          : relatedQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
