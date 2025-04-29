// app_exceptions.dart

class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, {this.prefix});

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException(super.message)
    : super(prefix: 'Error during data fetching: ');
}

class BadRequestException extends AppException {
  BadRequestException(super.message) : super(prefix: 'Bad request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException(super.message) : super(prefix: 'Unauthorized: ');
}

class NotFoundException extends AppException {
  NotFoundException(super.message) : super(prefix: 'Not found: ');
}

class ConflictException extends AppException {
  ConflictException(super.message) : super(prefix: 'Conflict: ');
}

class ForbiddenException extends AppException {
  ForbiddenException(super.message) : super(prefix: 'Forbidden: ');
}

class InternalServerException extends AppException {
  InternalServerException(super.message)
    : super(prefix: 'Internal server error: ');
}

class NoInternetException extends AppException {
  NoInternetException(super.message) : super(prefix: 'No internet: ');
}

class TimeoutException extends AppException {
  TimeoutException(super.message) : super(prefix: 'Timeout error: ');
}

class TokenExpiredException extends AppException {
  TokenExpiredException(super.message) : super(prefix: 'Token expired: ');
}
