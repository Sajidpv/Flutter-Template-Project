import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  static void handleError(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;
    final message = switch (statusCode) {
      400 => "Bad Request",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      409 => "Conflict",
      500 => "Internal Server Error",
      _ => "Something went wrong",
    };
    debugPrint("❌ Dio error [$statusCode]: $message");
    throw DioException(requestOptions: e.requestOptions, error: message);
  }
}
