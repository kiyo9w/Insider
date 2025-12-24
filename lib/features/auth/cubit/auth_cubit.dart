import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/exceptions/api_exception.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/data/repositories/auth/auth_repository.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/services/notification_service/notification_service.dart';
import 'package:rest_client/rest_client.dart' as rc;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthRepository authRepository,
    required LocalStorageService localStorageService,
    required NotificationService notificationService,
  })  : _authRepository = authRepository,
        _localStorageService = localStorageService,
        _notificationService = notificationService,
        super(const AuthState());

  final AuthRepository _authRepository;
  final LocalStorageService _localStorageService;
  final NotificationService _notificationService;

  Future<void> checkAuthStatus() async {
    print('AuthCubit: checkAuthStatus started');
    
    try {
      final token =
          await _localStorageService.getString(key: AppKeys.accessTokenKey);
      if (token == null || token.isEmpty) {
        print('AuthCubit: Token is null or empty');
        emit(const AuthState());
        return;
      }

      // Properly await the user data read
      final userJson = await _localStorageService.getString(key: AppKeys.userKey);
      final cachedUser = _decodeUser(userJson);
      print('AuthCubit: Cached user found: ${cachedUser != null}');

      emit(
        state.copyWith(
          isLoading: true,
          error: null,
          accessToken: token,
          refreshToken: token,
          isAuthenticated: cachedUser != null,
          user: cachedUser,
        ),
      );

      try {
        final user = await _authRepository.me();
        await _saveUser(user);
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: true,
            user: user,
            accessToken: token,
            refreshToken: token,
          ),
        );
      } on ApiException catch (e) {
        if (e.statusCode == 401 || e.statusCode == 403) {
          await _clearSession();
          emit(
            state.copyWith(
              isLoading: false,
              isAuthenticated: false,
              error: e.message,
              user: null,
              accessToken: null,
              refreshToken: null,
            ),
          );
          return;
        }

        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: cachedUser != null,
            user: cachedUser,
            accessToken: token,
            refreshToken: token,
            error: e.message,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: cachedUser != null,
            user: cachedUser,
            accessToken: token,
            refreshToken: token,
          ),
        );
      }
    } on PlatformException catch (e) {
      // Handle secure storage exceptions (like BadPaddingException on Android)
      print('AuthCubit: Platform exception during checkAuthStatus: ${e.message}');
      if (e.message?.contains('BadPaddingException') ?? false) {
        // Storage is corrupted, clear everything
        await _clearSession();
      }
      emit(const AuthState());
    } catch (e) {
      print('AuthCubit: Unexpected error during checkAuthStatus: $e');
      emit(const AuthState());
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    print('AuthCubit: login started for $email');
    emit(state.copyWith(isLoading: true, error: null));
    try {
      // Fetch CSRF token first
      await _authRepository.getCsrfToken();

      final response = await _authRepository.login(
        rc.LoginRequest(
          email: email,
          password: password,
        ),
      );

      // New backend returns {user: {...}, session: {token: "...", ...}}
      final sessionToken = response.session.token;
      final userData = response.user;

      print('AuthCubit: Saving token to storage: $sessionToken');
      await _localStorageService.setValue(
        key: AppKeys.accessTokenKey,
        value: sessionToken,
      );
      await _localStorageService.setValue(
        key: AppKeys.refreshTokenKey,
        value: sessionToken, // Using session token for both
      );
      
      // Verify token was saved
      final savedToken = await _localStorageService.getString(key: AppKeys.accessTokenKey);
      print('AuthCubit: Verified saved token: $savedToken');

      await _notificationService.registerTokenWithServer();

      await _saveUser(userData);
      emit(
        state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          accessToken: sessionToken,
          refreshToken: sessionToken,
          user: userData,
        ),
      );
      print('AuthCubit: Login complete, state updated');
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      // Fetch CSRF token first
      await _authRepository.getCsrfToken();

      // First, register the user
      await _authRepository.register(
        rc.RegisterRequest(
          email: email,
          password: password,
        ),
      );

      // Backend likely returns success, now auto-login
      // After successful registration, automatically log the user in
      final loginResponse = await _authRepository.login(
        rc.LoginRequest(
          email: email,
          password: password,
        ),
      );

      // New backend returns {user: {...}, session: {token: "...", ...}}
      final sessionToken = loginResponse.session.token;
      final userData = loginResponse.user;

      // Save tokens to secure storage
      await _localStorageService.setValue(
        key: AppKeys.accessTokenKey,
        value: sessionToken,
      );
      await _localStorageService.setValue(
        key: AppKeys.refreshTokenKey,
        value: sessionToken, // Using session token for both
      );

      await _notificationService.registerTokenWithServer();

      await _saveUser(userData);
      // Update the state to authenticated
      emit(
        state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          accessToken: sessionToken,
          refreshToken: sessionToken,
          user: userData,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
    } catch (_) {
      // Ignore API errors on logout to ensure local session is cleared
    } finally {
      await _clearSession();
      emit(const AuthState());
    }
  }

  Future<void> _clearSession() async {
    print('AuthCubit: Clearing session');
    try {
      await _localStorageService.removeEntry(key: AppKeys.accessTokenKey);
      await _localStorageService.removeEntry(key: AppKeys.refreshTokenKey);
      await _localStorageService.removeEntry(key: AppKeys.userKey);
    } catch (e) {
      print('AuthCubit: Error clearing session: $e');
      // Continue anyway to ensure state is cleared
    }
  }

  Future<void> _saveUser(rc.UserData user) async {
    print('AuthCubit: Saving user ${user.id}');
    await _localStorageService.setValue(
      key: AppKeys.userKey,
      value: jsonEncode(user.toJson()),
    );
  }

  rc.UserData? _decodeUser(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      final map = jsonDecode(value) as Map<String, dynamic>;
      return rc.UserData.fromJson(map);
    } catch (_) {
      return null;
    }
  }
}
