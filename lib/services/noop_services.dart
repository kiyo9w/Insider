import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/services/crashlytics_service/crashlytics_service.dart';
import 'package:insider/services/notification_service/notification_service.dart';

class NoOpCrashlyticsService implements CrashlyticsService {
  @override
  Future<void> init() async {
    debugPrint('NoOpCrashlyticsService: init called (iOS bypass)');
  }

  @override
  Future<void> recordException(dynamic exception, StackTrace? stack) async {
    debugPrint(
        'NoOpCrashlyticsService: recordException called (iOS bypass): $exception');
  }
}

class NoOpNotificationService implements NotificationService {
  final _controller = StreamController<RemoteMessage>.broadcast();

  @override
  Stream<RemoteMessage> get foregroundMessageStream => _controller.stream;

  @override
  Future<void> init() async {
    debugPrint('NoOpNotificationService: init called (iOS bypass)');
  }

  @override
  Future<String?> getToken() async {
    debugPrint('NoOpNotificationService: getToken called (iOS bypass)');
    return null;
  }

  @override
  Future<void> registerTokenWithServer({String? token}) async {
    debugPrint(
        'NoOpNotificationService: registerTokenWithServer called (iOS bypass)');
  }
}
