import 'package:firebaseapp/features/auth/model/user.model.dart';

abstract class AuthRepository {
  Future<UserModel> loginApi(String email, String password);
  Future<UserModel> googleLoginApi();
  UserModel? getCurrentUserApi();
  Future<UserModel?> reloadUserApi();
  Future<dynamic> registerApi(Map<String, dynamic> data);
  Future<void> emailVerificationApi();
  Future<void> resetPasswordApi(String email);
  Future<void> logoutApi();
}
