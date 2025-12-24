import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_client/rest_client.dart' as rc;
// Bring in the generated copyWith helpers for rc.UserData
import 'package:rest_client/src/models/auth/auth_models.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? error,
    String? accessToken,
    String? refreshToken,
    rc.UserData? user,
  }) = _AuthState;
}
