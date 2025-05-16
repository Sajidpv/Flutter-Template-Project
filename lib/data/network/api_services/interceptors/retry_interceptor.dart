import 'dart:io';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor(
    this.dio, {
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      final requestOptions = err.requestOptions;

      for (int attempt = 0; attempt < maxRetries; attempt++) {
        try {
          await Future.delayed(
            retryDelay * (attempt + 1),
          ); // Exponential backoff if needed
          final response = await dio.request(
            requestOptions.path,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            options: Options(
              method: requestOptions.method,
              headers: requestOptions.headers,
              contentType: requestOptions.contentType,
              responseType: requestOptions.responseType,
            ),
          );
          return handler.resolve(response);
        } catch (e) {
          if (attempt == maxRetries - 1 || e is! DioException) {
            return handler.next(e is DioException ? e : err);
          }
        }
      }
    }
    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.error is SocketException;
  }
}
