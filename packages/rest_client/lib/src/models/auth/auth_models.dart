import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required bool success,
    required String message,
    required RegisterData data,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
abstract class RegisterData with _$RegisterData {
  const factory RegisterData({
    required String email,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _RegisterData;

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required UserData user,
    required SessionData session,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
    required String email,
    String? image,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String role,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
abstract class SessionData with _$SessionData {
  const factory SessionData({
    required String id,
    required String token,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'ip_address') required String ipAddress,
    @JsonKey(name: 'user_agent') required String userAgent,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _SessionData;

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);
}

@freezed
abstract class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String email,
    @JsonKey(name: 'reset_token') required String resetToken,
    @JsonKey(name: 'new_password') required String newPassword,
    @JsonKey(name: 'confirm_password') required String confirmPassword,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);
}

@freezed
abstract class ResetPasswordResponse with _$ResetPasswordResponse {
  const factory ResetPasswordResponse({
    required bool success,
    required String message,
    required ResetPasswordData data,
  }) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}

@freezed
abstract class ResetPasswordData with _$ResetPasswordData {
  const factory ResetPasswordData({
    @JsonKey(name: 'user_id') required String userId,
    required String email,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _ResetPasswordData;

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDataFromJson(json);
}
