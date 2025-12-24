// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    _RegisterResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: RegisterData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(_RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) =>
    _RegisterData(
      email: json['email'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
    );

Map<String, dynamic> _$RegisterDataToJson(_RegisterData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'expires_in': instance.expiresIn,
    };

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
      session: SessionData.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{'user': instance.user, 'session': instance.session};

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  image: json['image'] as String?,
  imageUrl: json['image_url'] as String?,
  role: json['role'] as String,
  emailVerified: json['email_verified'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'image': instance.image,
  'image_url': instance.imageUrl,
  'role': instance.role,
  'email_verified': instance.emailVerified,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_SessionData _$SessionDataFromJson(Map<String, dynamic> json) => _SessionData(
  id: json['id'] as String,
  token: json['token'] as String,
  userId: json['user_id'] as String,
  expiresAt: json['expires_at'] as String,
  ipAddress: json['ip_address'] as String,
  userAgent: json['user_agent'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$SessionDataToJson(_SessionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'user_id': instance.userId,
      'expires_at': instance.expiresAt,
      'ip_address': instance.ipAddress,
      'user_agent': instance.userAgent,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordRequest(
  email: json['email'] as String,
  resetToken: json['reset_token'] as String,
  newPassword: json['new_password'] as String,
  confirmPassword: json['confirm_password'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  _ResetPasswordRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'reset_token': instance.resetToken,
  'new_password': instance.newPassword,
  'confirm_password': instance.confirmPassword,
};

_ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: ResetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResetPasswordResponseToJson(
  _ResetPasswordResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ResetPasswordData _$ResetPasswordDataFromJson(Map<String, dynamic> json) =>
    _ResetPasswordData(
      userId: json['user_id'] as String,
      email: json['email'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$ResetPasswordDataToJson(_ResetPasswordData instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
