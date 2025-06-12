import 'package:erp/features/auth/model/user.model.dart';

abstract class AuthRepository {
  Future<UserModel> loginApi(String email, String password);
  Future<dynamic> registerApi(Map<String, dynamic> data);
  Future<void> logoutApi();
}
