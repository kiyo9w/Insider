import 'package:insider/configs/app_config.dart';
import 'package:insider/injector/injector.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioModule {
  DioModule._();

  static const String dioInstanceName = 'dioInstance';
  static final GetIt _injector = Injector.instance;

  static void setup() {
    _setupDio();
  }

  static void _setupDio() {
    /// Cookie Jar for persisting session cookies
    _injector.registerLazySingleton<CookieJar>(() => CookieJar());

    /// Dio
    _injector.registerLazySingleton<Dio>(
      () {
        // TODO(boilerplate): custom DIO here
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: AppConfig.baseUrl,
            headers: const {
              'Accept': 'application/json',
            },
          ),
        );

        // Add cookie manager to persist session cookies
        final cookieJar = _injector<CookieJar>();
        dio.interceptors.add(CookieManager(cookieJar));
        print('DioModule: CookieManager added');

        // Auth interceptor - The backend uses session cookies, not Bearer tokens
        // Cookies are automatically handled by CookieManager
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              // Backend uses session cookies (sessionid), not Authorization header
              // Just pass through - cookies are handled by CookieManager

              // Ensure sessionid is present in cookies (for restart/persistence)
              final storage = _injector<LocalStorageService>();
              final token =
                  await storage.getString(key: AppKeys.accessTokenKey);

              if (token != null && token.isNotEmpty) {
                final currentCookies =
                    options.headers['cookie'] as String? ?? '';
                if (!currentCookies.contains('sessionid=')) {
                  final separator = currentCookies.isNotEmpty ? '; ' : '';
                  options.headers['cookie'] =
                      '$currentCookies${separator}sessionid=$token';
                }
              }

              handler.next(options);
            },
            onError: (error, handler) async {
              final status = error.response?.statusCode;
              // Only clear session on auth errors that are actually auth failures
              // (not just missing profile/data)
              if (status == 401 || status == 403) {
                print('DioInterceptor: Got $status error, clearing session');
                try {
                  final storage = _injector<LocalStorageService>();
                  await storage.removeEntry(key: AppKeys.accessTokenKey);
                  await storage.removeEntry(key: AppKeys.refreshTokenKey);
                  await storage.removeEntry(key: AppKeys.userKey);

                  // Clear cookies as well
                  final cookieJar = _injector<CookieJar>();
                  await cookieJar.deleteAll();
                  print('DioInterceptor: Cleared all cookies');
                } catch (_) {
                  // Ignore cleanup failures; continue propagating error.
                }
              }
              handler.next(error);
            },
          ),
        );
        // Ensure cookies (session) are sent, especially on web
        dio.options.extra['withCredentials'] = true;
        if (kIsWeb) {
          final adapter = dio.httpClientAdapter;
          try {
            // ignore: avoid_dynamic_calls
            (adapter as dynamic).withCredentials = true;
          } catch (_) {
            // Best effort; if unavailable just continue without throwing.
          }
        }
        if (!kReleaseMode) {
          dio.interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
              request: false,
            ),
          );
        }
        return dio;
      },
      instanceName: dioInstanceName,
    );
  }
}
