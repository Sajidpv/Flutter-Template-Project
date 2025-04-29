import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:stock_shift_pro/cors/configs/app_strings.dart';
import 'package:stock_shift_pro/cors/configs/enums.dart';
import 'package:stock_shift_pro/features/auth/model/user.model.dart';
import '../../../../utils/local_storage/local_storage.dart';

//singleton class
class SessionController {
  LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _session = SessionController._internel();

  bool get isLoggedIn => token != null && token!.isNotEmpty;

  String? token, email, password;
  UserRole? role;
  UserModel? user;

  factory SessionController() {
    return _session;
  }

  SessionController._internel();

  // saving data into shared preference

  Future<void> saveUserInPreference(dynamic response) async {
    try {
      sharedPreferenceClass.setValue(SessionKey.USER, jsonEncode(response));
      sharedPreferenceClass.setValue(SessionKey.TOKEN, response.token);
      ////storing login time
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> saveCredentialsInPreference(
    String email,
    String password,
  ) async {
    try {
      sharedPreferenceClass.setValue(SessionKey.EMAIL, email);
      sharedPreferenceClass.setValue(SessionKey.PASSWORD, password);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //getting User Data from shared Preference
  // and assigning it to session controller to used it across the app
  // getting User Data from shared Preference
  Future<void> getUserFromPreference() async {
    try {
      var userData = await sharedPreferenceClass.readValue(SessionKey.USER);
      var token = await sharedPreferenceClass.readValue(SessionKey.TOKEN);
      var email = await sharedPreferenceClass.readValue(SessionKey.EMAIL);
      var password = await sharedPreferenceClass.readValue(SessionKey.PASSWORD);
      if (userData != null && userData.isNotEmpty) {
        final UserResponse userResponse = UserResponse.fromJson(
          jsonDecode(userData),
        );

        user = userResponse.user;
        role = user?.role;
      }
      if (token != null && token.isNotEmpty) {
        this.token = token;
      }
      if (email != null && email.isNotEmpty) {
        this.email = email;
      }
      if (password != null && password.isNotEmpty) {
        this.password = password;
      }
    } catch (e, stacktrace) {
      debugPrint("Error in getting user from preference: $e");
      debugPrint(stacktrace.toString());
    }
  }

  Future<void> clearSession() async {
    await sharedPreferenceClass.clearValue(SessionKey.TOKEN);
    await sharedPreferenceClass.clearValue(SessionKey.USER);
    token = null;
    user = null;
    role = null;
  }

  Future<void> clearCredentials() async {
    await sharedPreferenceClass.clearValue(SessionKey.EMAIL);
    await sharedPreferenceClass.clearValue(SessionKey.PASSWORD);
  }
}
