import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_client/rest_client.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    ProfileData? profile,
    @Default(false) bool isLoading,
    @Default(false) bool isLoaded,
    String? error,
  }) = _ProfileState;
}
