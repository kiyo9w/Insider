import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_models.freezed.dart';
part 'profile_models.g.dart';

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    required String id,
    required String name,
    required String email,
    String? username,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    String? image,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? introduction,
    String? location,
    required String role,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
abstract class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
    String? name,
    String? username,
    String? introduction,
    String? location,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
}

@freezed
abstract class PersonalizationData with _$PersonalizationData {
  const factory PersonalizationData({
    @JsonKey(name: 'user_id') required String userId,
    required String bio,
    @JsonKey(name: 'interested_categories')
    required List<String> interestedCategories,
  }) = _PersonalizationData;

  factory PersonalizationData.fromJson(Map<String, dynamic> json) =>
      _$PersonalizationDataFromJson(json);
}

@freezed
abstract class UpdatePersonalizationRequest
    with _$UpdatePersonalizationRequest {
  const factory UpdatePersonalizationRequest({
    String? bio,
    List<String>? interestedCategories,
  }) = _UpdatePersonalizationRequest;

  factory UpdatePersonalizationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePersonalizationRequestFromJson(json);
}
