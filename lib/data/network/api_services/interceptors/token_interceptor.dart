import 'package:dio/dio.dart';
import 'package:erp/features/auth/view.model/services/session_services.dart';

class TokenInterceptor extends Interceptor {
  final SessionController _sessionController = SessionController();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _sessionController.token;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
