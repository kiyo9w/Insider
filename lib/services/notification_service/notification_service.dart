import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationService {
  Stream<RemoteMessage> get foregroundMessageStream;
  Future<void> init();
  Future<String?> getToken();
  Future<void> registerTokenWithServer({String? token});
}
