// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileData {

 String get id; String get name; String get email; String? get username;@JsonKey(name: 'email_verified') bool get emailVerified; String? get image;@JsonKey(name: 'image_url') String? get imageUrl; String? get introduction; String? get location; String get role;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDataCopyWith<ProfileData> get copyWith => _$ProfileDataCopyWithImpl<ProfileData>(this as ProfileData, _$identity);

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.image, image) || other.image == image)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.introduction, introduction) || other.introduction == introduction)&&(identical(other.location, location) || other.location == location)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,username,emailVerified,image,imageUrl,introduction,location,role,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileData(id: $id, name: $name, email: $email, username: $username, emailVerified: $emailVerified, image: $image, imageUrl: $imageUrl, introduction: $introduction, location: $location, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileDataCopyWith<$Res>  {
  factory $ProfileDataCopyWith(ProfileData value, $Res Function(ProfileData) _then) = _$ProfileDataCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String? username,@JsonKey(name: 'email_verified') bool emailVerified, String? image,@JsonKey(name: 'image_url') String? imageUrl, String? introduction, String? location, String role,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ProfileDataCopyWithImpl<$Res>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._self, this._then);

  final ProfileData _self;
  final $Res Function(ProfileData) _then;

/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? username = freezed,Object? emailVerified = null,Object? image = freezed,Object? imageUrl = freezed,Object? introduction = freezed,Object? location = freezed,Object? role = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,introduction: freezed == introduction ? _self.introduction : introduction // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileData].
extension ProfileDataPatterns on ProfileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileData value)  $default,){
final _that = this;
switch (_that) {
case _ProfileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? username, @JsonKey(name: 'email_verified')  bool emailVerified,  String? image, @JsonKey(name: 'image_url')  String? imageUrl,  String? introduction,  String? location,  String role, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.username,_that.emailVerified,_that.image,_that.imageUrl,_that.introduction,_that.location,_that.role,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  String? username, @JsonKey(name: 'email_verified')  bool emailVerified,  String? image, @JsonKey(name: 'image_url')  String? imageUrl,  String? introduction,  String? location,  String role, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileData():
return $default(_that.id,_that.name,_that.email,_that.username,_that.emailVerified,_that.image,_that.imageUrl,_that.introduction,_that.location,_that.role,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  String? username, @JsonKey(name: 'email_verified')  bool emailVerified,  String? image, @JsonKey(name: 'image_url')  String? imageUrl,  String? introduction,  String? location,  String role, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.username,_that.emailVerified,_that.image,_that.imageUrl,_that.introduction,_that.location,_that.role,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileData implements ProfileData {
  const _ProfileData({required this.id, required this.name, required this.email, this.username, @JsonKey(name: 'email_verified') required this.emailVerified, this.image, @JsonKey(name: 'image_url') this.imageUrl, this.introduction, this.location, required this.role, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);

@override final  String id;
@override final  String name;
@override final  String email;
@override final  String? username;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;
@override final  String? image;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  String? introduction;
@override final  String? location;
@override final  String role;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDataCopyWith<_ProfileData> get copyWith => __$ProfileDataCopyWithImpl<_ProfileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.image, image) || other.image == image)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.introduction, introduction) || other.introduction == introduction)&&(identical(other.location, location) || other.location == location)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,username,emailVerified,image,imageUrl,introduction,location,role,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileData(id: $id, name: $name, email: $email, username: $username, emailVerified: $emailVerified, image: $image, imageUrl: $imageUrl, introduction: $introduction, location: $location, role: $role, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileDataCopyWith<$Res> implements $ProfileDataCopyWith<$Res> {
  factory _$ProfileDataCopyWith(_ProfileData value, $Res Function(_ProfileData) _then) = __$ProfileDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, String? username,@JsonKey(name: 'email_verified') bool emailVerified, String? image,@JsonKey(name: 'image_url') String? imageUrl, String? introduction, String? location, String role,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ProfileDataCopyWithImpl<$Res>
    implements _$ProfileDataCopyWith<$Res> {
  __$ProfileDataCopyWithImpl(this._self, this._then);

  final _ProfileData _self;
  final $Res Function(_ProfileData) _then;

/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? username = freezed,Object? emailVerified = null,Object? image = freezed,Object? imageUrl = freezed,Object? introduction = freezed,Object? location = freezed,Object? role = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ProfileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,introduction: freezed == introduction ? _self.introduction : introduction // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$UpdateProfileRequest {

 String? get name; String? get username; String? get introduction; String? get location;
/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith => _$UpdateProfileRequestCopyWithImpl<UpdateProfileRequest>(this as UpdateProfileRequest, _$identity);

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.introduction, introduction) || other.introduction == introduction)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,introduction,location);

@override
String toString() {
  return 'UpdateProfileRequest(name: $name, username: $username, introduction: $introduction, location: $location)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileRequestCopyWith<$Res>  {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value, $Res Function(UpdateProfileRequest) _then) = _$UpdateProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? username, String? introduction, String? location
});




}
/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateProfileRequest _self;
  final $Res Function(UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? username = freezed,Object? introduction = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,introduction: freezed == introduction ? _self.introduction : introduction // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileRequest].
extension UpdateProfileRequestPatterns on UpdateProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? username,  String? introduction,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.name,_that.username,_that.introduction,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? username,  String? introduction,  String? location)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest():
return $default(_that.name,_that.username,_that.introduction,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? username,  String? introduction,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.name,_that.username,_that.introduction,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileRequest implements UpdateProfileRequest {
  const _UpdateProfileRequest({this.name, this.username, this.introduction, this.location});
  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestFromJson(json);

@override final  String? name;
@override final  String? username;
@override final  String? introduction;
@override final  String? location;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileRequestCopyWith<_UpdateProfileRequest> get copyWith => __$UpdateProfileRequestCopyWithImpl<_UpdateProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.introduction, introduction) || other.introduction == introduction)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,introduction,location);

@override
String toString() {
  return 'UpdateProfileRequest(name: $name, username: $username, introduction: $introduction, location: $location)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileRequestCopyWith<$Res> implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$UpdateProfileRequestCopyWith(_UpdateProfileRequest value, $Res Function(_UpdateProfileRequest) _then) = __$UpdateProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? username, String? introduction, String? location
});




}
/// @nodoc
class __$UpdateProfileRequestCopyWithImpl<$Res>
    implements _$UpdateProfileRequestCopyWith<$Res> {
  __$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateProfileRequest _self;
  final $Res Function(_UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? username = freezed,Object? introduction = freezed,Object? location = freezed,}) {
  return _then(_UpdateProfileRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,introduction: freezed == introduction ? _self.introduction : introduction // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PersonalizationData {

@JsonKey(name: 'user_id') String get userId; String get bio;@JsonKey(name: 'interested_categories') List<String> get interestedCategories;
/// Create a copy of PersonalizationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalizationDataCopyWith<PersonalizationData> get copyWith => _$PersonalizationDataCopyWithImpl<PersonalizationData>(this as PersonalizationData, _$identity);

  /// Serializes this PersonalizationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalizationData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.interestedCategories, interestedCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,bio,const DeepCollectionEquality().hash(interestedCategories));

@override
String toString() {
  return 'PersonalizationData(userId: $userId, bio: $bio, interestedCategories: $interestedCategories)';
}


}

/// @nodoc
abstract mixin class $PersonalizationDataCopyWith<$Res>  {
  factory $PersonalizationDataCopyWith(PersonalizationData value, $Res Function(PersonalizationData) _then) = _$PersonalizationDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String bio,@JsonKey(name: 'interested_categories') List<String> interestedCategories
});




}
/// @nodoc
class _$PersonalizationDataCopyWithImpl<$Res>
    implements $PersonalizationDataCopyWith<$Res> {
  _$PersonalizationDataCopyWithImpl(this._self, this._then);

  final PersonalizationData _self;
  final $Res Function(PersonalizationData) _then;

/// Create a copy of PersonalizationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? bio = null,Object? interestedCategories = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,interestedCategories: null == interestedCategories ? _self.interestedCategories : interestedCategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalizationData].
extension PersonalizationDataPatterns on PersonalizationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalizationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalizationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalizationData value)  $default,){
final _that = this;
switch (_that) {
case _PersonalizationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalizationData value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalizationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String bio, @JsonKey(name: 'interested_categories')  List<String> interestedCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalizationData() when $default != null:
return $default(_that.userId,_that.bio,_that.interestedCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String bio, @JsonKey(name: 'interested_categories')  List<String> interestedCategories)  $default,) {final _that = this;
switch (_that) {
case _PersonalizationData():
return $default(_that.userId,_that.bio,_that.interestedCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  String bio, @JsonKey(name: 'interested_categories')  List<String> interestedCategories)?  $default,) {final _that = this;
switch (_that) {
case _PersonalizationData() when $default != null:
return $default(_that.userId,_that.bio,_that.interestedCategories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalizationData implements PersonalizationData {
  const _PersonalizationData({@JsonKey(name: 'user_id') required this.userId, required this.bio, @JsonKey(name: 'interested_categories') required final  List<String> interestedCategories}): _interestedCategories = interestedCategories;
  factory _PersonalizationData.fromJson(Map<String, dynamic> json) => _$PersonalizationDataFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override final  String bio;
 final  List<String> _interestedCategories;
@override@JsonKey(name: 'interested_categories') List<String> get interestedCategories {
  if (_interestedCategories is EqualUnmodifiableListView) return _interestedCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interestedCategories);
}


/// Create a copy of PersonalizationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalizationDataCopyWith<_PersonalizationData> get copyWith => __$PersonalizationDataCopyWithImpl<_PersonalizationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalizationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalizationData&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._interestedCategories, _interestedCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,bio,const DeepCollectionEquality().hash(_interestedCategories));

@override
String toString() {
  return 'PersonalizationData(userId: $userId, bio: $bio, interestedCategories: $interestedCategories)';
}


}

/// @nodoc
abstract mixin class _$PersonalizationDataCopyWith<$Res> implements $PersonalizationDataCopyWith<$Res> {
  factory _$PersonalizationDataCopyWith(_PersonalizationData value, $Res Function(_PersonalizationData) _then) = __$PersonalizationDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String bio,@JsonKey(name: 'interested_categories') List<String> interestedCategories
});




}
/// @nodoc
class __$PersonalizationDataCopyWithImpl<$Res>
    implements _$PersonalizationDataCopyWith<$Res> {
  __$PersonalizationDataCopyWithImpl(this._self, this._then);

  final _PersonalizationData _self;
  final $Res Function(_PersonalizationData) _then;

/// Create a copy of PersonalizationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? bio = null,Object? interestedCategories = null,}) {
  return _then(_PersonalizationData(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,interestedCategories: null == interestedCategories ? _self._interestedCategories : interestedCategories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$UpdatePersonalizationRequest {

 String? get bio; List<String>? get interestedCategories;
/// Create a copy of UpdatePersonalizationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePersonalizationRequestCopyWith<UpdatePersonalizationRequest> get copyWith => _$UpdatePersonalizationRequestCopyWithImpl<UpdatePersonalizationRequest>(this as UpdatePersonalizationRequest, _$identity);

  /// Serializes this UpdatePersonalizationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePersonalizationRequest&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.interestedCategories, interestedCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio,const DeepCollectionEquality().hash(interestedCategories));

@override
String toString() {
  return 'UpdatePersonalizationRequest(bio: $bio, interestedCategories: $interestedCategories)';
}


}

/// @nodoc
abstract mixin class $UpdatePersonalizationRequestCopyWith<$Res>  {
  factory $UpdatePersonalizationRequestCopyWith(UpdatePersonalizationRequest value, $Res Function(UpdatePersonalizationRequest) _then) = _$UpdatePersonalizationRequestCopyWithImpl;
@useResult
$Res call({
 String? bio, List<String>? interestedCategories
});




}
/// @nodoc
class _$UpdatePersonalizationRequestCopyWithImpl<$Res>
    implements $UpdatePersonalizationRequestCopyWith<$Res> {
  _$UpdatePersonalizationRequestCopyWithImpl(this._self, this._then);

  final UpdatePersonalizationRequest _self;
  final $Res Function(UpdatePersonalizationRequest) _then;

/// Create a copy of UpdatePersonalizationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bio = freezed,Object? interestedCategories = freezed,}) {
  return _then(_self.copyWith(
bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,interestedCategories: freezed == interestedCategories ? _self.interestedCategories : interestedCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatePersonalizationRequest].
extension UpdatePersonalizationRequestPatterns on UpdatePersonalizationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePersonalizationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePersonalizationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePersonalizationRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePersonalizationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePersonalizationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePersonalizationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? bio,  List<String>? interestedCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePersonalizationRequest() when $default != null:
return $default(_that.bio,_that.interestedCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? bio,  List<String>? interestedCategories)  $default,) {final _that = this;
switch (_that) {
case _UpdatePersonalizationRequest():
return $default(_that.bio,_that.interestedCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? bio,  List<String>? interestedCategories)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePersonalizationRequest() when $default != null:
return $default(_that.bio,_that.interestedCategories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePersonalizationRequest implements UpdatePersonalizationRequest {
  const _UpdatePersonalizationRequest({this.bio, final  List<String>? interestedCategories}): _interestedCategories = interestedCategories;
  factory _UpdatePersonalizationRequest.fromJson(Map<String, dynamic> json) => _$UpdatePersonalizationRequestFromJson(json);

@override final  String? bio;
 final  List<String>? _interestedCategories;
@override List<String>? get interestedCategories {
  final value = _interestedCategories;
  if (value == null) return null;
  if (_interestedCategories is EqualUnmodifiableListView) return _interestedCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UpdatePersonalizationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePersonalizationRequestCopyWith<_UpdatePersonalizationRequest> get copyWith => __$UpdatePersonalizationRequestCopyWithImpl<_UpdatePersonalizationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePersonalizationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePersonalizationRequest&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._interestedCategories, _interestedCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio,const DeepCollectionEquality().hash(_interestedCategories));

@override
String toString() {
  return 'UpdatePersonalizationRequest(bio: $bio, interestedCategories: $interestedCategories)';
}


}

/// @nodoc
abstract mixin class _$UpdatePersonalizationRequestCopyWith<$Res> implements $UpdatePersonalizationRequestCopyWith<$Res> {
  factory _$UpdatePersonalizationRequestCopyWith(_UpdatePersonalizationRequest value, $Res Function(_UpdatePersonalizationRequest) _then) = __$UpdatePersonalizationRequestCopyWithImpl;
@override @useResult
$Res call({
 String? bio, List<String>? interestedCategories
});




}
/// @nodoc
class __$UpdatePersonalizationRequestCopyWithImpl<$Res>
    implements _$UpdatePersonalizationRequestCopyWith<$Res> {
  __$UpdatePersonalizationRequestCopyWithImpl(this._self, this._then);

  final _UpdatePersonalizationRequest _self;
  final $Res Function(_UpdatePersonalizationRequest) _then;

/// Create a copy of UpdatePersonalizationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bio = freezed,Object? interestedCategories = freezed,}) {
  return _then(_UpdatePersonalizationRequest(
bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,interestedCategories: freezed == interestedCategories ? _self._interestedCategories : interestedCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
