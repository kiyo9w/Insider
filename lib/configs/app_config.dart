class AppConfig {
  static String baseUrl = '';

  static const String defaultLocale = 'en';
  static const String firebaseWebVapidKey =
      String.fromEnvironment('FIREBASE_WEB_VAPID_KEY', defaultValue: '');

  /// Toggle this to switch between staging and production.
  /// true  => staging (api-dev.trinq.site)
  /// false => production (api.trinq.site)
  static bool useStaging = false;

  static void configure() {
    if (useStaging) {
      configStaging();
    } else {
      configProduction();
    }
  }

  static void configStaging() {
    baseUrl = 'https://api-dev.trinq.site';
  }

  static void configProduction() {
    baseUrl = 'https://api.trinq.site';
  }

  // Backward compatibility for any legacy calls.
  static void configDev() => configStaging();
}
