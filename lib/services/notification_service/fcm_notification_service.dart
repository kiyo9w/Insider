import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/configs/app_config.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/services/log_service/log_service.dart';
import 'package:insider/services/notification_service/notification_service.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // TODO: Handling logic here. For now, just print.
  debugPrint('Handling a background message: ${message.messageId}');
}

class FcmNotificationService implements NotificationService {
  FcmNotificationService({
    required LogService logService,
    required Dio dio,
    required LocalStorageService localStorageService,
  })  : _log = logService,
        _dio = dio,
        _localStorageService = localStorageService;

  final LogService _log;
  final Dio _dio;
  final LocalStorageService _localStorageService;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final _foregroundMessageController = BehaviorSubject<RemoteMessage>();

  @override
  Stream<RemoteMessage> get foregroundMessageStream =>
      _foregroundMessageController.stream;

  @override
  Future<void> init() async {
    _log.i('Initializing NotificationService...');
    final settings = await _fcm.requestPermission();
    _log.i('Notification permission status: ${settings.authorizationStatus}');

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      await _fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    final token = await getToken();
    await _registerTokenIfPossible(token, reason: 'initialization');

    // Listen for token refreshes
    _fcm.onTokenRefresh.listen((token) {
      _log.i('FCM Token Refreshed: $token');
      unawaited(
        _registerTokenIfPossible(
          token,
          reason: 'token refresh',
        ),
      );
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _log.i('Got a message whilst in the foreground!');
      _log.i('Message data: ${message.data}');
      if (message.notification != null) {
        _log.i('Message also contained a notification: '
            '${message.notification}');
      }

      _foregroundMessageController.add(message);
    });

    if (!kIsWeb) {
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      final token = await _fcm.getToken(
        vapidKey: kIsWeb && AppConfig.firebaseWebVapidKey.isNotEmpty
            ? AppConfig.firebaseWebVapidKey
            : null,
      );
      _log.i('FCM Token: $token');
      return token;
    } catch (e, s) {
      _log.e('Failed to get FCM token', e, s);
      return null;
    }
  }

  @override
  Future<void> registerTokenWithServer({String? token}) async {
    final resolvedToken = token ?? await getToken();
    await _registerTokenIfPossible(
      resolvedToken,
      reason: 'manual registration',
    );
  }

  Future<void> _registerTokenIfPossible(
    String? token, {
    required String reason,
  }) async {
    if (token == null || token.isEmpty) {
      _log.w('Skip FCM registration ($reason): token is null/empty');
      return;
    }

    if (!await _hasActiveSession()) {
      _log.i('Skip FCM registration ($reason): user not authenticated');
      return;
    }

    try {
      await _dio.post(
        '/api/v1/notifications/token',
        data: {
          'token': token,
          'device_type': _deviceType,
        },
      );
      _log.i('Registered FCM token with backend ($reason)');
    } on DioException catch (e, s) {
      // Backend may not expose this endpoint yet; ignore 404 gracefully.
      if (e.response?.statusCode == 404) {
        _log.w('Skip FCM registration ($reason): endpoint not found (404)');
        return;
      }
      _log.e('Failed to register FCM token ($reason)', e, s);
    } catch (e, s) {
      _log.e('Failed to register FCM token ($reason)', e, s);
    }
  }

  Future<bool> _hasActiveSession() async {
    final sessionToken =
        await _localStorageService.getString(key: AppKeys.accessTokenKey);
    return sessionToken != null && sessionToken.isNotEmpty;
  }

  String get _deviceType {
    if (kIsWeb) return 'web';
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return 'ios';
      case TargetPlatform.android:
        return 'android';
      default:
        return 'web';
    }
  }
}
