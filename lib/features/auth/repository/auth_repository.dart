import 'package:stock_shift_pro/features/auth/model/user.model.dart';

abstract class AuthRepository {
  Future<UserResponse> loginApi(dynamic data);
  Future<dynamic> registerApi(dynamic data);
}
