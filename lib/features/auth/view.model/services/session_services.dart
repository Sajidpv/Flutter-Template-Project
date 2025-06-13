import 'dart:convert';

import 'package:firebaseapp/cors/configs/app_strings.dart';
import 'package:firebaseapp/cors/configs/enums.dart';
import 'package:firebaseapp/features/auth/model/user.model.dart';
import 'package:firebaseapp/utils/local_storage/local_storage.dart';

class SessionController {
  LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _instance = SessionController._internal();

  factory SessionController() => _instance;

  SessionController._internal();

  UserModel? _userResponse;

  bool get isLoggedIn => _userResponse != null;
  UserModel? get user => _userResponse;
  UserRole? get role => _userResponse?.role;
  bool? get isVerified => _userResponse?.isVerified;

  Future<void> saveUserInPreference(UserModel response) async {
    sharedPreferenceClass.setValue(SessionKey.USER, jsonEncode(response));
    _userResponse = response;
  }

  Future<void> getUserFromPreference() async {
    var userData = await sharedPreferenceClass.readValue(SessionKey.USER);
    if (userData != null && userData.isNotEmpty) {
      final UserModel userResponse = UserModel.fromJson(jsonDecode(userData));

      _userResponse = userResponse;
    }
  }

  Future<void> clearSession() async {
    await sharedPreferenceClass.clearValue(SessionKey.USER);
    _userResponse = null;
  }
}
