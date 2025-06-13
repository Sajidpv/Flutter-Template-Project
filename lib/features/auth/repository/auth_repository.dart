import 'package:firebaseapp/features/auth/model/user.model.dart';

abstract class AuthRepository {
  Future<UserModel> loginApi(String email, String password);
  Future<dynamic> registerApi(Map<String, dynamic> data);
  Future<void> emailVerificationApi();
  Future<void> logoutApi();
}
