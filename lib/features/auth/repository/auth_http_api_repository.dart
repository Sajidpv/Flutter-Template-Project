import 'package:erp/data/network/api_services/base_api_services.dart';
import 'package:erp/features/auth/model/user.model.dart';
import 'package:erp/features/auth/repository/auth_repository.dart';

class AuthHttpApiRepository implements AuthRepository {
  final BaseFirebaseService _firebase;

  AuthHttpApiRepository(this._firebase);
  @override
  Future<UserModel> loginApi(String email, String password) async {
    final userCred = await _firebase.signIn(email, password);
    final userDoc = await _firebase.getDocument(
      collectionPath: 'users',
      docId: userCred.user!.uid,
    );
    return UserModel.fromFirebase(userDoc, userCred.user!.uid);
  }

  @override
  Future<void> registerApi(Map<String, dynamic> data) async {
    final userCred = await _firebase.signUp(data['email'], data['password']);
    await _firebase.setDocument(
      collectionPath: 'users',
      docId: userCred.user!.uid,
      data: {
        'name': data['name'],
        'email': data['email'],
        'mobile': data['mobile'],
      },
    );
  }

  @override
  Future<void> logoutApi() => _firebase.signOut();
}
