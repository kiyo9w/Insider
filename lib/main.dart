import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:insider/bootstrap.dart';
import 'package:insider/configs/app_config.dart';

Future<void> main() async {
  await bootstrap(
    firebaseInitialization: () async {
      if (!Platform.isIOS) {
        await Firebase.initializeApp();
      }
    },
    flavorConfiguration: () async {
      AppConfig.configure();
    },
  );
}
