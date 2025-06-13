// ignore_for_file: constant_identifier_names

var thisYear = DateTime.now().year.toString();

class AppStrings {
  static const String appTitle = 'Firebase App.';

  ///////////////ERROR messages////////////////////////
  static const String netWorkError =
      'We’re unable to show results.\nPlease check your data\nconnection.';
  static const String retry = 'RETRY';
  static const String timeoutError = 'Network Request time out';
  static const String noInternet = 'No Internet Connection';
  static const String serverError =
      'Error occured while communicating with server';
  static const String communicationError = 'Error During Communication';
  static const String invalidRequest = 'Invalid request';
  static const String noContent = 'No Content found';
  static const String unauthorizedRequest = 'Unauthorised request';
  static const String invalidInput = 'Invalid Input';
  static const String unknownerror = 'Unknown error';
  static const String errorMessage = 'Something went wrong. Please try again.';
}

class SessionKey {
  static const String USER = "user-data";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String TOKEN = "token";
  static const String DEVICE_TOKEN = "device-fcm-token";
}
