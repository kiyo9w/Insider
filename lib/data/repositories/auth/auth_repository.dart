import 'package:rest_client/rest_client.dart';

abstract class AuthRepository {
  Future<void> getCsrfToken();
  Future<void> register({
    required String name,
    required String email,
    required String password,
  });
  Future<LoginResponse> login(LoginRequest request);
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
  Future<void> logout();
  Future<UserData> me();
  Future<void> verifyEmail({required String token});
  Future<void> resendVerification({required String email});
  Future<void> resendVerificationMe();
}
