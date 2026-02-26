import 'dart:io';
import 'package:insider/core/exceptions/api_exception.dart';
import 'package:insider/data/repositories/profile/profile_repository.dart';
import 'package:rest_client/rest_client.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required ProfileClient profileClient,
  }) : _profileClient = profileClient;

  late final ProfileClient _profileClient;

  @override
  Future<ProfileData> getProfile() async {
    return _profileClient.getProfile().onApiError;
  }

  @override
  Future<ProfileData> updateProfile(UpdateProfileRequest request) async {
    final payload = Map<String, dynamic>.from(request.toJson())
      ..removeWhere((_, value) => value == null);
    return _profileClient.updateProfile(payload).onApiError;
  }

  @override
  Future<ProfileData> uploadAvatar(File file) async {
    return _profileClient.uploadAvatar(file).onApiError;
  }

  @override
  Future<ProfileData> deleteAvatar() async {
    return _profileClient.deleteAvatar().onApiError;
  }

  @override
  Future<PersonalizationData> getPersonalization() async {
    return _profileClient.getPersonalization().onApiError;
  }

  @override
  Future<PersonalizationData> updatePersonalization(
      UpdatePersonalizationRequest request) async {
    return _profileClient.updatePersonalization(request.toJson()).onApiError;
  }
}
