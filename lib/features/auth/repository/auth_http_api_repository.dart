import 'package:erp/cors/configs/urls.dart';
import 'package:erp/data/network/api_services/base_api_services.dart';
import 'package:erp/features/auth/model/user.model.dart';
import 'package:erp/features/auth/repository/auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {
  final BaseApiServices _apiServices;

  AuthHttpApiRepository(this._apiServices);

  @override
  Future<UserResponse> loginApi(dynamic data) async {
    dynamic response = await _apiServices.getPostApiResponse(
      Urls.loginUrl,
      data,
    );
    return UserResponse.fromJson(response['responseJson']);
  }

  // @override
  // Future<dynamic> logoutApi() async {
  //   dynamic response = await _apiServices.getPostApiResponse(
  //     Urls.logoutUrl,
  //     null,
  //   );
  //   return response['responseJson'];
  // }

  @override
  Future<dynamic> registerApi(dynamic data) async {
    dynamic response = await _apiServices.getPostApiResponse(
      Urls.registerUserUrl,
      data,
    );
    return response['responseJson'];
  }
}
