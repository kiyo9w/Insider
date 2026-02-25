import 'dart:io';

import 'package:dio/dio.dart';
import 'package:insider/core/exceptions/api_exception.dart';
import 'package:insider/data/repositories/auth/auth_repository.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/injector/modules/dio_module.dart';
import 'package:rest_client/rest_client.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthClient authClient,
    Dio? dio,
  })  : _authClient = authClient,
        _dio = dio ??
            Injector.instance<Dio>(instanceName: DioModule.dioInstanceName);

  late final AuthClient _authClient;
  late final Dio _dio;
  // String? _csrfCookie;

  @override
  Future<void> getCsrfToken() async {
    try {
      final response = await _dio.get('/api/v1/auth/csrf-token');
      // Persist CSRF cookie for subsequent POST requests.
      final cookies = response.headers[HttpHeaders.setCookieHeader];
      if (cookies != null && cookies.isNotEmpty) {
        // Just checking if cookies exist
      }

      // Also attach CSRF token header when provided.
      final body = response.data;
      final token =
          body is Map<String, dynamic> ? body['csrfToken']?.toString() : null;
      if (token != null && token.isNotEmpty) {
        // Backend expects this exact header casing/key.
        _dio.options.headers['X-CSRF-Token'] = token;
      }
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _dio.post(
        '/api/v1/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return _authClient.login(request.toJson()).onApiError;
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest request) async {
    return _authClient.resetPassword(request.toJson()).onApiError;
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post('/api/v1/auth/logout');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<UserData> me() async {
    try {
      final response = await _dio.get('/api/v1/auth/me');
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final userJson = (data['data'] ?? data) as Map<String, dynamic>;
        return UserData.fromJson(userJson);
      }
      throw ApiException(message: 'Invalid response');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> verifyEmail({required String token}) async {
    try {
      await _dio.post(
        '/api/v1/auth/verify-email',
        data: {'token': token},
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> resendVerification({required String email}) async {
    try {
      await _dio.post(
        '/api/v1/auth/resend-verification',
        queryParameters: {'email': email},
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> resendVerificationMe() async {
    try {
      await _dio.post('/api/v1/auth/resend-verification-me');
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}
