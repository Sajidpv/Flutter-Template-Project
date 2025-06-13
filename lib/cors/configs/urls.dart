import 'app_configs.dart';

class Urls {
  static const String getAllProductUrl =
      '${AppConfig.BASE_URL}/admin/filterAndSortProducts';
  // -- User routes -- //
  static const String registerUserUrl = '${AppConfig.BASE_URL}/user/';
  static const String editUsfirebaseapprofileByAdminUrl =
      '${AppConfig.BASE_URL}/user/edit-profile';
  static const String addSubAdminByAdminUrl =
      '${AppConfig.BASE_URL}/user/sub-admin';
  static const String loginUrl = '${AppConfig.BASE_URL}/user/login';
  static const String changeUserStatusByAdminUrl =
      '${AppConfig.BASE_URL}/user/:id/status';
  static const String changeMobileNumberByAdminUrl =
      '${AppConfig.BASE_URL}/user/change-mobile';
  static const String changeUserAccessCodeUrl =
      '${AppConfig.BASE_URL}/user/accessCode';

  static const String generateAdminAccessCodeUrl =
      '${AppConfig.BASE_URL}/user/admin/accessCode';

  static const String getProductBySlugUrl =
      '${AppConfig.BASE_URL}/notification/';
  static const String getProductByCategoryUrl =
      '${AppConfig.BASE_URL}/products/';
  static const String getCategoryUrl = '${AppConfig.BASE_URL}/warehouse';
  static const String getCategoryBySlugUrl = '${AppConfig.BASE_URL}/orders/';
  static const String logidnUrl = '${AppConfig.BASE_URL}/entry';
}
