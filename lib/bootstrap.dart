import 'dart:async';
import 'package:insider/core/bloc_core/bloc_observer.dart';
import 'package:insider/features/app/view/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/services/crashlytics_service/crashlytics_service.dart';
import 'package:insider/services/notification_service/notification_service.dart';

Future<void> bootstrap({
  AsyncCallback? firebaseInitialization,
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await firebaseInitialization?.call();
    Logger.level = Level.verbose;
    await flavorConfiguration?.call();

    Injector.init();

    await Injector.instance.allReady();

    await Injector.instance<NotificationService>().init();

    Bloc.observer = AppBlocObserver();

    runApp(const App());
  }, (error, stack) {
    try {
      if (Injector.instance.isRegistered<CrashlyticsService>() &&
          Injector.instance.isReadySync<CrashlyticsService>()) {
        Injector.instance<CrashlyticsService>().recordException(error, stack);
      } else {
        debugPrint(
            'Crashlytics not ready/registered, dropping error: $error\n$stack');
      }
    } catch (e) {
      debugPrint('Failed to report error to Crashlytics: $e');
      debugPrint('Original error: $error\n$stack');
    }
  });
}
