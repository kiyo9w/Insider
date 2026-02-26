import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/exceptions/api_exception.dart';
import 'package:insider/data/repositories/profile/profile_repository.dart';
import 'package:insider/features/profile/cubit/profile_state.dart';
import 'package:rest_client/rest_client.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const ProfileState());

  final ProfileRepository _profileRepository;

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final profile = await _profileRepository.getProfile();
      emit(state.copyWith(
        profile: profile,
        isLoading: false,
        isLoaded: true,
      ));
    } on ApiException catch (e) {
      if (e.statusCode == 404) {
        // Profile not found (not created yet) - this is ok
        emit(state.copyWith(isLoading: false, isLoaded: true, error: null));
        return;
      }
      if (e.statusCode == 401 || e.statusCode == 403) {
        // Not authenticated - this is ok, just don't load profile
        emit(state.copyWith(isLoading: false, isLoaded: true, error: null));
        return;
      }
      emit(state.copyWith(
        isLoading: false,
        error: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> updateProfile({
    String? name,
    String? username,
    String? introduction,
    String? location,
  }) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final profile = await _profileRepository.updateProfile(
        UpdateProfileRequest(
          name: name,
          username: username,
          introduction: introduction,
          location: location,
        ),
      );
      emit(state.copyWith(
        profile: profile,
        isLoading: false,
        isLoaded: true,
      ));
    } on ApiException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.message ?? 'Failed to update profile',
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> uploadAvatar(File file) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final profile = await _profileRepository.uploadAvatar(file);
      emit(state.copyWith(
        profile: profile,
        isLoading: false,
        isLoaded: true,
      ));
    } on ApiException catch (e) {
      if (e.statusCode == 401 || e.statusCode == 403) {
        // Not authenticated - silently fail
        emit(state.copyWith(isLoading: false, error: null));
        return;
      }
      emit(state.copyWith(
        isLoading: false,
        error: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> deleteAvatar() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final profile = await _profileRepository.deleteAvatar();
      emit(state.copyWith(
        profile: profile,
        isLoading: false,
        isLoaded: true,
      ));
    } on ApiException catch (e) {
      if (e.statusCode == 401 || e.statusCode == 403) {
        // Not authenticated - silently fail
        emit(state.copyWith(isLoading: false, error: null));
        return;
      }
      emit(state.copyWith(
        isLoading: false,
        error: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
