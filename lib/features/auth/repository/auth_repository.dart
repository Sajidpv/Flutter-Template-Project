import 'package:erp/features/auth/model/user.model.dart';

abstract class AuthRepository {
  Future<UserResponse> loginApi(dynamic data);
  Future<dynamic> registerApi(dynamic data);
}
