import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:erp/cors/configs/app_strings.dart';
import 'package:erp/data/app_exceptions.dart';
import 'package:erp/data/network/api_services/base_api_services.dart';
import 'package:erp/data/network/api_services/interceptors/token_interceptor.dart';
import 'package:erp/features/auth/view.model/services/session_services.dart';

class NetworkApiService implements BaseApiServices {
  final Dio _dio = Dio();

  NetworkApiService() {
    _dio.options.connectTimeout = const Duration(seconds: 20);
    _dio.options.receiveTimeout = const Duration(seconds: 20);
    _dio.options.responseType = ResponseType.json;
    _dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    // Add PrettyDioLogger interceptor for logging
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );

    // Add custom interceptors
    // _dio.interceptors.add(RetryInterceptor(_dio)); // Retry logic
    _dio.interceptors.add(TokenInterceptor()); // Token management

    // Add additional custom interceptors if needed
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add any custom headers or logging here
          debugPrint("Request: ${options.method} ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // debugPrint("Response: ${response.statusCode} ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          debugPrint("Error: ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }

  // Set the authorization token if required
  void _setAuthorizationToken() {
    final token = SessionController().token;
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
  }

  // Set custom headers for requests
  void _setCustomHeaders(Map<String, String>? customHeader) {
    _dio.options.headers.clear();
    if (customHeader != null) {
      _dio.options.headers.addAll(customHeader);
    } else {
      _dio.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
    }
  }

  Future<Response> _retryRequest(RequestOptions options) async {
    final retries = 3;
    int attempt = 0;

    final Dio retryDio =
        Dio()
          ..options = _dio.options.copyWith(
            baseUrl: _dio.options.baseUrl,
            headers: options.headers,
          );

    while (attempt < retries) {
      try {
        final response = await retryDio.request(
          options.path,
          data: options.data,
          queryParameters: options.queryParameters,
          options: Options(
            method: options.method,
            contentType: options.contentType,
            responseType: options.responseType,
          ),
        );
        return response;
      } catch (e) {
        attempt++;
        if (attempt == retries) rethrow;
        await Future.delayed(Duration(seconds: 2));
      }
    }

    throw Exception('Retry failed after $retries attempts.');
  }

  // GET request
  @override
  Future getGetApiResponse(String url, {bool isAuthorize = false}) async {
    if (kDebugMode) print("GET: $url");

    try {
      if (isAuthorize) _setAuthorizationToken();

      final response = await _dio.get(url);
      return _returnResponse(response);
    } on DioException catch (e) {
      if (isTimeout(e)) {
        final retryResponse = await _retryRequest(e.requestOptions);
        return _returnResponse(retryResponse);
      } else {
        throw _handleDioException(e);
      }
    }
  }

  // POST request with optional images
  @override
  Future getPostApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    String? token,
    List<XFile>? imageFiles,
    Map<String, String>? customHeader,
  }) async {
    // if (kDebugMode) {
    //   print("POST: $url");
    //   print("DATA: $data");
    // }

    try {
      _setCustomHeaders(customHeader);

      if (isAuthorize && token != null) {
        _dio.options.headers["Authorization"] = "Bearer $token";
      } else if (isAuthorize) {
        _setAuthorizationToken();
      }

      Response response;

      if (imageFiles != null && imageFiles.isNotEmpty) {
        final formData = FormData();

        data.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });

        for (var file in imageFiles) {
          formData.files.add(
            MapEntry(
              'images[]',
              await MultipartFile.fromFile(file.path, filename: file.name),
            ),
          );
        }

        response = await _dio.post(url, data: formData);
      } else {
        response = await _dio.post(url, data: data);
      }

      return _returnResponse(response);
    } on DioException catch (e) {
      if (isTimeout(e)) {
        final retryResponse = await _retryRequest(e.requestOptions);
        return _returnResponse(retryResponse);
      } else {
        throw _handleDioException(e);
      }
    }
  }

  // PUT request
  @override
  Future getPutApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    Map<String, String>? customHeader,
  }) async {
    // if (kDebugMode) {
    //   print("PUT: $url");
    //   print("DATA: $data");
    // }

    try {
      _setCustomHeaders(customHeader);

      if (isAuthorize) _setAuthorizationToken();

      final response = await _dio.put(url, data: data);
      return _returnResponse(response);
    } on DioException catch (e) {
      if (isTimeout(e)) {
        final retryResponse = await _retryRequest(e.requestOptions);
        return _returnResponse(retryResponse);
      } else {
        throw _handleDioException(e);
      }
    }
  }

  // PATCH request
  @override
  Future getPatchApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    Map<String, String>? customHeader,
  }) async {
    if (kDebugMode) {
      print("PATCH: $url");
      print("DATA: $data");
    }

    try {
      _setCustomHeaders(customHeader);

      if (isAuthorize) _setAuthorizationToken();

      final response = await _dio.patch(url, data: data);
      return _returnResponse(response);
    } on DioException catch (e) {
      if (isTimeout(e)) {
        final retryResponse = await _retryRequest(e.requestOptions);
        return _returnResponse(retryResponse);
      } else {
        throw _handleDioException(e);
      }
    }
  }

  // DELETE request
  @override
  Future getDeleteApiResponse(
    String url,
    dynamic data, {
    bool isAuthorize = false,
    Map<String, String>? customHeader,
  }) async {
    if (kDebugMode) print("DELETE: $url");

    try {
      _setCustomHeaders(customHeader);

      if (isAuthorize) _setAuthorizationToken();

      final response = await _dio.delete(url, data: data);
      return _returnResponse(response);
    } on DioException catch (e) {
      if (isTimeout(e)) {
        final retryResponse = await _retryRequest(e.requestOptions);
        return _returnResponse(retryResponse);
      } else {
        throw _handleDioException(e);
      }
    }
  }

  // Handle response
  dynamic _returnResponse(Response response) {
    if (kDebugMode) print("Response Code: ${response.statusCode}");

    switch (response.statusCode) {
      case 200:
      case 201:
        return {
          'responseJson': response.data,
          'responseCode': response.statusCode,
        };
      case 204:
        return {
          'responseJson': {
            'success': true,
            'message': 'No data found',
            'data': [],
          },
          'responseCode': response.statusCode,
        };
      case 400:
        throw BadRequestException(response.data['message'].toString());
      case 401:
        throw UnauthorisedException(response.data['message'].toString());
      case 403:
        throw ForbiddenException(response.data['message'].toString());
      case 404:
        throw NotFoundException(response.data['message'].toString());
      case 409:
        throw ConflictException(response.data['message'].toString());
      case 500:
        // final body =
        //     response.data is String ? jsonDecode(response.data) : response.data;
        throw InternalServerException(
          //  body['message'] ??
          'Internal server error!',
        );
      default:
        throw FetchDataException(AppStrings.serverError);
    }
  }

  // Handle Dio exceptions
  Exception _handleDioException(DioException e) {
    if (kDebugMode) print("DioException: ${e.message}");

    // Timeout
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return FetchDataException(AppStrings.timeoutError);
    }
    // Server responded with a non-2xx status
    else if (e.type == DioExceptionType.badResponse && e.response != null) {
      return _returnResponse(e.response!);
    }
    // SocketException – could be no internet or host unreachable
    else if ((e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.unknown) &&
        e.error is SocketException) {
      final socketError = e.error as SocketException;

      if (socketError.osError?.message.contains('Network is unreachable') ==
              true ||
          socketError.osError?.message.contains(
                'No address associated with hostname',
              ) ==
              true ||
          socketError.osError?.errorCode == 101) {
        return NoInternetException(
          AppStrings.noInternet,
        ); // 🟢 Your custom message for no internet
      }

      return InternalServerException(
        AppStrings.serverError,
      ); // 🟠 Fallback socket error
    }
    // Other unknown errors
    else {
      return FetchDataException(AppStrings.unknownerror);
    }
  }

  // Check if error is timeout
  bool isTimeout(DioException e) =>
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.receiveTimeout;
}
