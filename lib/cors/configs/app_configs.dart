// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'app_strings.dart';

class AppConfig {
  static bool isProduction = false;

  static String app_name = AppStrings.appTitle;

  static const bool HTTPS = false;

  static const DOMAIN_PATH = "192.168.31.25:4009/"; //loaclhost

  static const String API_ENDPATH = "api";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "$PROTOCOL$DOMAIN_PATH";
  static const String BASE_URL = "$RAW_BASE_URL$API_ENDPATH";
}
