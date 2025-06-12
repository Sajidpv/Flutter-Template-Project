import 'package:erp/features/auth/model/user.model.dart';
import 'package:erp/utils/local_storage/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionController {
  LocalStorage sharedPreferenceClass = LocalStorage();
  static final SessionController _instance = SessionController._internal();

  factory SessionController() => _instance;

  SessionController._internal();

  UserModel? _userResponse;

  bool get isLoggedIn => _userResponse != null;
  String? get token => _userResponse?.token;
  UserModel? get user => _userResponse?.user;
  String? get role => _userResponse?.user?.role;

  Future<void> saveUserInPreference(UserModel response) async {
    _userResponse = response;
    final prefs = await sharedPreferenceClass.readValue();
    await prefs.setString('user_data', jsonEncode(response.toJson()));
  }

  Future<void> getUserFromPreference() async {
    final prefs = await sharedPreferenceClass.getInstance();
    final data = prefs.getString('user_data');
    if (data != null) {
      final json = jsonDecode(data);
      _userResponse = UserResponse.fromJson(json);
    }
  }

  Future<void> clearSession() async {
    final prefs = await sharedPreferenceClass.getInstance();
    await prefs.remove('user_data');
    _userResponse = null;
  }
}

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:erp/cors/configs/app_strings.dart';
// import 'package:erp/cors/configs/enums.dart';
// import 'package:erp/features/auth/model/user.model.dart';
// import '../../../../utils/local_storage/local_storage.dart';

// //singleton class
// class SessionController {
//   LocalStorage sharedPreferenceClass = LocalStorage();
//   static final SessionController _session = SessionController._internel();

//   bool get isLoggedIn => token != null && token!.isNotEmpty;

//   String? token, email, password, fcmToken;
//   UserRole? role;
//   UserModel? user;

//   factory SessionController() {
//     return _session;
//   }

//   SessionController._internel();

//   // saving data into shared preference

//   Future<void> saveUserInPreference(dynamic response) async {
//     try {
//       sharedPreferenceClass.setValue(SessionKey.USER, jsonEncode(response));
//       sharedPreferenceClass.setValue(SessionKey.TOKEN, response.token);
//       await SessionController().getUserFromPreference();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> saveFCMTokenInPreference(String token) async {
//     try {
//       sharedPreferenceClass.setValue(SessionKey.DEVICE_TOKEN, token);
//       await SessionController().getUserFromPreference();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   Future<void> saveCredentialsInPreference(
//     String email,
//     String password,
//   ) async {
//     try {
//       sharedPreferenceClass.setValue(SessionKey.EMAIL, email);
//       sharedPreferenceClass.setValue(SessionKey.PASSWORD, password);
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   //getting User Data from shared Preference
//   // and assigning it to session controller to used it across the app
//   // getting User Data from shared Preference
//   Future<void> getUserFromPreference() async {
//     try {
//       var userData = await sharedPreferenceClass.readValue(SessionKey.USER);
//       var token = await sharedPreferenceClass.readValue(SessionKey.TOKEN);
//       var fcmToken = await sharedPreferenceClass.readValue(
//         SessionKey.DEVICE_TOKEN,
//       );
//       var email = await sharedPreferenceClass.readValue(SessionKey.EMAIL);
//       var password = await sharedPreferenceClass.readValue(SessionKey.PASSWORD);
//       if (userData != null && userData.isNotEmpty) {
//         final UserResponse userResponse = UserResponse.fromJson(
//           jsonDecode(userData),
//         );

//         user = userResponse.user;
//         role = user?.role;
//       }
//       if (fcmToken != null && fcmToken.isNotEmpty) {
//         this.fcmToken = fcmToken;
//       }
//       if (token != null && token.isNotEmpty) {
//         this.token = token;
//       }
//       if (email != null && email.isNotEmpty) {
//         this.email = email;
//       }
//       if (password != null && password.isNotEmpty) {
//         this.password = password;
//       }
//     } catch (e, stacktrace) {
//       debugPrint("Error in getting user from preference: $e");
//       debugPrint(stacktrace.toString());
//     }
//   }

//   Future<void> clearSession() async {
//     await sharedPreferenceClass.clearValue(SessionKey.TOKEN);
//     await sharedPreferenceClass.clearValue(SessionKey.USER);
//     token = null;
//     user = null;
//     role = null;
//   }

//   Future<void> clearCredentials() async {
//     await sharedPreferenceClass.clearValue(SessionKey.EMAIL);
//     await sharedPreferenceClass.clearValue(SessionKey.PASSWORD);
//   }
// }
