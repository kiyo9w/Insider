import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:insider/bootstrap.dart';
import 'package:insider/configs/app_config.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {
      try {
        await Firebase.initializeApp();
      } catch (e, s) {
        debugPrint('Firebase initializeApp failed: $e\n$s');
        rethrow;
      }
    },
    flavorConfiguration: () async {
      AppConfig.configure();
    },
  );
}
