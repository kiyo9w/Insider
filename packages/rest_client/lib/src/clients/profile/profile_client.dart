import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rest_client/src/models/profile/profile_models.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_client.g.dart';

@RestApi()
abstract class ProfileClient {
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @GET('/api/v1/profile/me')
  Future<ProfileData> getProfile();

  @PUT('/api/v1/profile/me')
  Future<ProfileData> updateProfile(@Body() Map<String, dynamic> request);

  @MultiPart()
  @POST('/api/v1/profile/avatar')
  Future<ProfileData> uploadAvatar(@Part(name: 'file') File file);

  @DELETE('/api/v1/profile/avatar')
  Future<ProfileData> deleteAvatar();

  @GET('/api/v1/profile/personalization')
  Future<PersonalizationData> getPersonalization();

  @PUT('/api/v1/profile/personalization')
  Future<PersonalizationData> updatePersonalization(
    @Body() Map<String, dynamic> request,
  );
}
