import 'package:dio/dio.dart';

/// Interceptor that automatically extracts CSRF tokens from responses
/// and adds them to subsequent non-GET requests.
class CsrfHeaderInterceptor extends Interceptor {
  CsrfHeaderInterceptor({required this.csrfHeaderName});

  final String csrfHeaderName;
  String? csrfToken;

  bool _needsCsrf(String method) {
    final m = method.toUpperCase();
    return m != 'GET' && m != 'HEAD' && m != 'OPTIONS';
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    if (data is Map) {
      final t = data['csrfToken'];
      if (t is String && t.trim().isNotEmpty) {
        csrfToken = t.trim();
      }
    }
    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_needsCsrf(options.method) && csrfToken != null) {
      options.headers[csrfHeaderName] = csrfToken!;
    }
    handler.next(options);
  }
}
