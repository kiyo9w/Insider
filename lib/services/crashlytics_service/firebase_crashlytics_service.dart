import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/services/crashlytics_service/crashlytics_service.dart';

class FirebaseCrashlyticsService implements CrashlyticsService {
  @override
  Future<void> init() async {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(!kDebugMode);

    if (!kDebugMode) {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
    }
  }

  @override
  Future<void> recordException(dynamic exception, StackTrace? stack) async {
    await FirebaseCrashlytics.instance.recordError(exception, stack);
  }
}
