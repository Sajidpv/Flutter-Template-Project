// app_exceptions.dart

class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, {this.prefix});

  @override
  String toString() {
    return message;
  }
}

class FetchDataException extends AppException {
  FetchDataException(super.message) : super();
}

class BadRequestException extends AppException {
  BadRequestException(super.message) : super();
}

class UnauthorisedException extends AppException {
  UnauthorisedException(super.message) : super();
}

class NotFoundException extends AppException {
  NotFoundException(super.message) : super();
}

class ConflictException extends AppException {
  ConflictException(super.message) : super();
}

class ForbiddenException extends AppException {
  ForbiddenException(super.message) : super();
}

class InternalServerException extends AppException {
  InternalServerException(super.message) : super();
}

class NoInternetException extends AppException {
  NoInternetException(super.message) : super();
}

class TimeoutException extends AppException {
  TimeoutException(super.message) : super();
}

class TokenExpiredException extends AppException {
  TokenExpiredException(super.message) : super();
}
