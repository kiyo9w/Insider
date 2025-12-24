import 'dart:async';

abstract class LocalStorageService {
  FutureOr<void> init();

  FutureOr<void> setValue({
    required String key,
    required dynamic value,
  });

  Future<Object?> getValue({
    required String key,
  });

  Future<String?> getString({
    required String key,
  });

  Future<int?> getInt({
    required String key,
  });

  Future<double?> getDouble({
    required String key,
  });

  Future<bool?> getBool({
    required String key,
  });

  Future<List<String>?> getStringList({
    required String key,
  });

  FutureOr<bool> removeEntry({
    required String key,
  });
}
