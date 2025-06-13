import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class BaseFirebaseService {
  // Auth
  Future<UserCredential> signIn(String email, String password);
  Future<UserCredential> signUp(String email, String password);
  Future<void> sendEmailVerification();
  Future<void> signOut();
  User? get currentUser;

  Future<User?> reloadUser();

  // Firestore
  Future<void> setDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  });

  Future<DocumentSnapshot> getDocument({
    required String collectionPath,
    required String docId,
  });

  Future<QuerySnapshot> getCollection(String collectionPath);

  Future<QuerySnapshot> queryCollection({
    required String collectionPath,
    String? field,
    dynamic isEqualTo,
    String? orderByField,
    bool descending = false,
    int? limit,
  });

  Future<void> runTransaction(
    Future<void> Function(Transaction) transactionHandler,
  );

  Future<void> batchWrite(List<WriteModel> writes);

  // Storage
  Future<String> uploadFile(
    String path,
    String filePath, {
    SettableMetadata? metadata,
  });
}

class WriteModel {
  final String collectionPath;
  final String docId;
  final Map<String, dynamic> data;
  final bool isUpdate;

  WriteModel({
    required this.collectionPath,
    required this.docId,
    required this.data,
    this.isUpdate = false,
  });
}
