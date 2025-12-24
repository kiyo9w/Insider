import 'package:dio/dio.dart';
import 'package:rest_client/src/models/auth/auth_models.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/api/v1/auth/register')
  Future<RegisterResponse> register(@Body() Map<String, dynamic> request);

  @GET('/api/v1/auth/csrf-token')
  Future<dynamic> getCsrfToken();

  @POST('/api/v1/auth/login')
  Future<LoginResponse> login(@Body() Map<String, dynamic> request);

  @POST('/api/v1/auth/reset-password')
  Future<ResetPasswordResponse> resetPassword(
    @Body() Map<String, dynamic> request,
  );
}
