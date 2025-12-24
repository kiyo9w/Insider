import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/services/log_service/log_service.dart';

class LocalStorageSecureService implements LocalStorageService {
  LocalStorageSecureService({required LogService logService})
      : _logService = logService;

  late FlutterSecureStorage _storage;
  final LogService _logService;
  final Map<String, String?> _cache = {};

  @override
  FutureOr<void> init() async {
    _storage = const FlutterSecureStorage();
    try {
      final all = await _storage.readAll();
      _cache
        ..clear()
        ..addAll(all);
      print('LocalStorageSecureService: init complete, keys: ${all.keys}');
    } catch (e, stack) {
      print('LocalStorageSecureService: init failed: $e');
      _logService.e('Secure storage init failed', e, stack);
    }
  }

  @override
  Future<Object?> getValue({required String key}) async {
    // Try cache first for performance
    if (_cache.containsKey(key)) {
      return _cache[key];
    }
    
    // If not in cache, read from storage
    try {
      final value = await _storage.read(key: key);
      if (value != null) {
        _cache[key] = value;
      }
      return value;
    } catch (e) {
      print('LocalStorageSecureService: read failed for key=$key: $e');
      return null;
    }
  }

  @override
  FutureOr<void> setValue({required String key, required dynamic value}) async {
    final stringValue = value is String ? value : value?.toString();
    print('LocalStorageSecureService: setValue key=$key, value=$stringValue');
    _cache[key] = stringValue;
    try {
      await _storage.write(key: key, value: stringValue);
      print('LocalStorageSecureService: write SUCCESS for key=$key');
    } catch (e) {
      print('LocalStorageSecureService: write failed for key=$key: $e');
    }
  }

  @override
  Future<bool?> getBool({required String key}) async {
    final raw = await getString(key: key);
    if (raw == null) return null;
    final lower = raw.toLowerCase();
    if (lower == 'true') return true;
    if (lower == 'false') return false;
    return null;
  }

  @override
  Future<double?> getDouble({required String key}) async {
    final raw = await getString(key: key);
    if (raw == null) return null;
    return double.tryParse(raw);
  }

  @override
  Future<int?> getInt({required String key}) async {
    final raw = await getString(key: key);
    if (raw == null) return null;
    return int.tryParse(raw);
  }

  @override
  Future<String?> getString({required String key}) async {
    print('LocalStorageSecureService: getString called for key=$key');
    final value = await getValue(key: key);
    print('LocalStorageSecureService: getString result for key=$key: $value');
    return value as String?;
  }

  @override
  Future<List<String>?> getStringList({required String key}) async {
    final raw = await getString(key: key);
    if (raw == null) return null;
    return raw.split(',');
  }

  @override
  FutureOr<bool> removeEntry({required String key}) async {
    _cache.remove(key);
    await _storage.delete(key: key);
    return true;
  }
}
