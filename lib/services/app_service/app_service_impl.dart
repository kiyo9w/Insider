import 'package:insider/configs/app_config.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/services/app_service/app_service.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';

class AppServiceImpl implements AppService {
  AppServiceImpl({
    required LocalStorageService localStorageService,
  }) : _localStorageService = localStorageService;
  late final LocalStorageService _localStorageService;

  @override
  Future<bool> get isDarkMode async =>
      await _localStorageService.getBool(key: AppKeys.darkModeKey) ?? false;

  @override
  Future<bool> get isFirstUse async =>
      await _localStorageService.getBool(key: AppKeys.isFirstUseKey) ?? true;

  @override
  Future<String> get locale async =>
      await _localStorageService.getString(key: AppKeys.localeKey) ??
      AppConfig.defaultLocale;

  @override
  Future<void> setIsDarkMode({required bool darkMode}) async {
    return _localStorageService.setValue(
      key: AppKeys.darkModeKey,
      value: darkMode,
    );
  }

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    return _localStorageService.setValue(
      key: AppKeys.isFirstUseKey,
      value: isFirstUse,
    );
  }

  @override
  Future<void> setLocale({required String locale}) async {
    return _localStorageService.setValue(
      key: AppKeys.localeKey,
      value: locale,
    );
  }
}
