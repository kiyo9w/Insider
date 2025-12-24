abstract class AppService {
  Future<String> get locale;
  Future<bool> get isDarkMode;
  Future<bool> get isFirstUse;

  Future<void> setLocale({
    required String locale,
  });

  Future<void> setIsDarkMode({
    required bool darkMode,
  });

  Future<void> setIsFirstUse({
    required bool isFirstUse,
  });
}
