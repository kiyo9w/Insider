// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThreadsState {
  UIStatus get status;
  List<ChatSnapshot> get threads;
  List<ChatSnapshot> get filteredThreads;
  String get searchQuery;
  String? get errorMessage;

  /// Create a copy of ThreadsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThreadsStateCopyWith<ThreadsState> get copyWith =>
      _$ThreadsStateCopyWithImpl<ThreadsState>(
          this as ThreadsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThreadsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.threads, threads) &&
            const DeepCollectionEquality()
                .equals(other.filteredThreads, filteredThreads) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(threads),
      const DeepCollectionEquality().hash(filteredThreads),
      searchQuery,
      errorMessage);

  @override
  String toString() {
    return 'ThreadsState(status: $status, threads: $threads, filteredThreads: $filteredThreads, searchQuery: $searchQuery, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ThreadsStateCopyWith<$Res> {
  factory $ThreadsStateCopyWith(
          ThreadsState value, $Res Function(ThreadsState) _then) =
      _$ThreadsStateCopyWithImpl;
  @useResult
  $Res call(
      {UIStatus status,
      List<ChatSnapshot> threads,
      List<ChatSnapshot> filteredThreads,
      String searchQuery,
      String? errorMessage});

  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ThreadsStateCopyWithImpl<$Res> implements $ThreadsStateCopyWith<$Res> {
  _$ThreadsStateCopyWithImpl(this._self, this._then);

  final ThreadsState _self;
  final $Res Function(ThreadsState) _then;

  /// Create a copy of ThreadsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? threads = null,
    Object? filteredThreads = null,
    Object? searchQuery = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      threads: null == threads
          ? _self.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ChatSnapshot>,
      filteredThreads: null == filteredThreads
          ? _self.filteredThreads
          : filteredThreads // ignore: cast_nullable_to_non_nullable
              as List<ChatSnapshot>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ThreadsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ThreadsState].
extension ThreadsStatePatterns on ThreadsState {
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
    TResult Function(_ThreadsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ThreadsState() when $default != null:
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
    TResult Function(_ThreadsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThreadsState():
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
    TResult? Function(_ThreadsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThreadsState() when $default != null:
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
            UIStatus status,
            List<ChatSnapshot> threads,
            List<ChatSnapshot> filteredThreads,
            String searchQuery,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ThreadsState() when $default != null:
        return $default(_that.status, _that.threads, _that.filteredThreads,
            _that.searchQuery, _that.errorMessage);
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
            UIStatus status,
            List<ChatSnapshot> threads,
            List<ChatSnapshot> filteredThreads,
            String searchQuery,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThreadsState():
        return $default(_that.status, _that.threads, _that.filteredThreads,
            _that.searchQuery, _that.errorMessage);
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
            UIStatus status,
            List<ChatSnapshot> threads,
            List<ChatSnapshot> filteredThreads,
            String searchQuery,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThreadsState() when $default != null:
        return $default(_that.status, _that.threads, _that.filteredThreads,
            _that.searchQuery, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ThreadsState implements ThreadsState {
  const _ThreadsState(
      {this.status = const UIStatus.initial(),
      final List<ChatSnapshot> threads = const [],
      final List<ChatSnapshot> filteredThreads = const [],
      this.searchQuery = '',
      this.errorMessage})
      : _threads = threads,
        _filteredThreads = filteredThreads;

  @override
  @JsonKey()
  final UIStatus status;
  final List<ChatSnapshot> _threads;
  @override
  @JsonKey()
  List<ChatSnapshot> get threads {
    if (_threads is EqualUnmodifiableListView) return _threads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_threads);
  }

  final List<ChatSnapshot> _filteredThreads;
  @override
  @JsonKey()
  List<ChatSnapshot> get filteredThreads {
    if (_filteredThreads is EqualUnmodifiableListView) return _filteredThreads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredThreads);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  final String? errorMessage;

  /// Create a copy of ThreadsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThreadsStateCopyWith<_ThreadsState> get copyWith =>
      __$ThreadsStateCopyWithImpl<_ThreadsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThreadsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._threads, _threads) &&
            const DeepCollectionEquality()
                .equals(other._filteredThreads, _filteredThreads) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_threads),
      const DeepCollectionEquality().hash(_filteredThreads),
      searchQuery,
      errorMessage);

  @override
  String toString() {
    return 'ThreadsState(status: $status, threads: $threads, filteredThreads: $filteredThreads, searchQuery: $searchQuery, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$ThreadsStateCopyWith<$Res>
    implements $ThreadsStateCopyWith<$Res> {
  factory _$ThreadsStateCopyWith(
          _ThreadsState value, $Res Function(_ThreadsState) _then) =
      __$ThreadsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UIStatus status,
      List<ChatSnapshot> threads,
      List<ChatSnapshot> filteredThreads,
      String searchQuery,
      String? errorMessage});

  @override
  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$ThreadsStateCopyWithImpl<$Res>
    implements _$ThreadsStateCopyWith<$Res> {
  __$ThreadsStateCopyWithImpl(this._self, this._then);

  final _ThreadsState _self;
  final $Res Function(_ThreadsState) _then;

  /// Create a copy of ThreadsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? threads = null,
    Object? filteredThreads = null,
    Object? searchQuery = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_ThreadsState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      threads: null == threads
          ? _self._threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ChatSnapshot>,
      filteredThreads: null == filteredThreads
          ? _self._filteredThreads
          : filteredThreads // ignore: cast_nullable_to_non_nullable
              as List<ChatSnapshot>,
      searchQuery: null == searchQuery
          ? _self.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ThreadsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

// dart format on
