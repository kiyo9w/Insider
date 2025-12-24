import 'package:rest_client/rest_client.dart';

abstract class AuthRepository {
  Future<void> getCsrfToken();
  Future<RegisterResponse> register(RegisterRequest request);
  Future<LoginResponse> login(LoginRequest request);
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
  Future<void> logout();
  Future<UserData> me();
  Future<void> verifyEmail({required String token});
  Future<void> resendVerification({required String email});
  Future<void> resendVerificationMe();
}
