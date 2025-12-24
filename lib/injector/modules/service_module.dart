import 'dart:io';
import 'package:dio/dio.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/injector/modules/dio_module.dart';
import 'package:insider/services/app_service/app_service.dart';
import 'package:insider/services/app_service/app_service_impl.dart';
import 'package:insider/services/crashlytics_service/crashlytics_service.dart';
import 'package:insider/services/crashlytics_service/firebase_crashlytics_service.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/services/local_storage_service/local_storage_secure_service.dart';
import 'package:insider/services/log_service/debug_log_service.dart';
import 'package:insider/services/log_service/log_service.dart';
import 'package:insider/services/noop_services.dart';
import 'package:insider/services/notification_service/fcm_notification_service.dart';
import 'package:insider/services/notification_service/notification_service.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerSingletonAsync<CrashlyticsService>(() async {
        if (Platform.isIOS) {
          return NoOpCrashlyticsService();
        }
        return FirebaseCrashlyticsService();
      })
      ..registerFactory<LogService>(DebugLogService.new)
      ..registerSingletonAsync<LocalStorageService>(() async {
        final storage = LocalStorageSecureService(
          logService: injector(),
        );
        await storage.init();
        return storage;
      })
      ..registerSingletonAsync<AppService>(() async {
        final storage = await injector.getAsync<LocalStorageService>();
        return AppServiceImpl(
          localStorageService: storage,
        );
      })
      ..registerSingletonAsync<NotificationService>(() async {
        if (Platform.isIOS) {
          return NoOpNotificationService();
        }
        final storage = await injector.getAsync<LocalStorageService>();
        return FcmNotificationService(
          logService: injector(),
          dio: injector<Dio>(instanceName: DioModule.dioInstanceName),
          localStorageService: storage,
        );
      });
  }
}
