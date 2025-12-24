import 'dart:io';
import 'package:rest_client/rest_client.dart';

abstract class ProfileRepository {
  Future<ProfileData> getProfile();

  Future<ProfileData> updateProfile(UpdateProfileRequest request);

  Future<ProfileData> uploadAvatar(File file);

  Future<ProfileData> deleteAvatar();

  Future<PersonalizationData> getPersonalization();

  Future<PersonalizationData> updatePersonalization(
      UpdatePersonalizationRequest request);
}
