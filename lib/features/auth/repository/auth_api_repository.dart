import 'package:firebaseapp/data/network/api_services/base_api_services.dart';
import 'package:firebaseapp/data/network/connectivity/connection.dart';
import 'package:firebaseapp/features/auth/model/user.model.dart';
import 'package:firebaseapp/features/auth/repository/auth_repository.dart';
import 'package:firebaseapp/utils/local_storage/sqflite_local_db.dart';

class AuthApiRepository implements AuthRepository {
  final BaseFirebaseService _firebase;
  final SqfliteLocalStorage _localDb;
  AuthApiRepository(this._firebase, this._localDb);

  @override
  Future<UserModel> loginApi(String email, String password) async {
    await Connection().initConnection();
    final isOnline = Connection().isConnected;
    if (isOnline) {
      try {
        final userCred = await _firebase.signIn(email, password);
        final userDoc = await _firebase.getDocument(
          collectionPath: 'Users',
          docId: userCred.user!.uid,
        );
        final user = UserModel.fromFirebase(userDoc, userCred.user!.uid);

        // Cache user locally
        await _localDb.setData('user', user.toJson());
        return user;
      } catch (e) {
        // If online and login fails, fallback to local cache
        final cachedJson = await _localDb.getData('user');
        if (cachedJson != null) {
          return UserModel.fromJson(cachedJson);
        }
        rethrow;
      }
    } else {
      // Offline: Use cached user if available
      final cachedJson = await _localDb.getData('user');
      if (cachedJson != null) {
        return UserModel.fromJson(cachedJson);
      }
      throw ('No internet connection and no cached user found.');
    }
  }

  @override
  Future emailVerificationApi() async =>
      await _firebase.sendEmailVerification();

  @override
  Future<void> registerApi(Map<String, dynamic> data) async {
    await Connection().initConnection();
    final isOnline = Connection().isConnected;
    if (!isOnline) {
      throw ('No internet connection.');
    }
    try {
      final userCred = await _firebase.signUp(data['email'], data['password']);

      final newUser = UserModel(
        uid: userCred.user?.uid ?? '',
        name: data['name'],
        email: data['email'],
        mobile: data['mobile'],
        role: data['role'],
        isVerified: false,
      );
      await _firebase.setDocument(
        collectionPath: 'Users',
        docId: userCred.user?.uid ?? '',
        data: newUser.toJson(),
      );
      // Cache user locally
      await _localDb.setData('user', newUser.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logoutApi() async {
    await _firebase.signOut();
    await _localDb.deleteData('user');
  }
}
