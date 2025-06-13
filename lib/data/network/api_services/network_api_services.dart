import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/data/network/api_services/base_api_services.dart';
import 'package:firebaseapp/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:firebaseapp/utils/exceptions/firebase_exceptions.dart';
import 'package:firebaseapp/utils/exceptions/format_exceptions.dart';
import 'package:firebaseapp/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class FirebaseApiService implements BaseFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // ------------------ Auth ------------------
  @override
  Future<UserCredential> signIn(String email, String password) {
    return _tryFirestoreCall(() {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    });
  }

  @override
  Future<UserCredential> signUp(String email, String password) {
    return _tryFirestoreCall(() {
      return _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  @override
  Future<void> sendEmailVerification() {
    return _tryFirestoreCall(() async {
      return _auth.currentUser?.sendEmailVerification();
    });
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<User?> reloadUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      return _auth.currentUser;
    }
    return null;
  }

  // ------------------ Firestore ------------------
  @override
  Future<void> setDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) {
    return _tryFirestoreCall(() {
      return _firestore.collection(collectionPath).doc(docId).set(data);
    });
  }

  @override
  Future<DocumentSnapshot> getDocument({
    required String collectionPath,
    required String docId,
  }) {
    return _tryFirestoreCall(() {
      return _firestore.collection(collectionPath).doc(docId).get();
    });
  }

  @override
  Future<QuerySnapshot> getCollection(String collectionPath) {
    return _firestore.collection(collectionPath).get();
  }

  @override
  Future<QuerySnapshot> queryCollection({
    required String collectionPath,
    String? field,
    dynamic isEqualTo,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) {
    Query query = _firestore.collection(collectionPath);

    if (field != null && isEqualTo != null) {
      query = query.where(field, isEqualTo: isEqualTo);
    }

    if (orderByField != null) {
      query = query.orderBy(orderByField, descending: descending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.get();
  }

  @override
  Future<void> runTransaction(
    Future<void> Function(Transaction) transactionHandler,
  ) {
    return _firestore.runTransaction(transactionHandler);
  }

  @override
  Future<void> batchWrite(List<WriteModel> writes) async {
    WriteBatch batch = _firestore.batch();

    for (var write in writes) {
      final docRef = _firestore
          .collection(write.collectionPath)
          .doc(write.docId);
      if (write.isUpdate) {
        batch.update(docRef, write.data);
      } else {
        batch.set(docRef, write.data);
      }
    }

    await batch.commit();
  }

  // ------------------ Firebase Storage ------------------
  @override
  Future<String> uploadFile(
    String path,
    String filePath, {
    SettableMetadata? metadata,
  }) async {
    final file = File(filePath);
    final ref = _storage.ref().child(path);
    final uploadTask = await ref.putFile(file, metadata);
    return await uploadTask.ref.getDownloadURL();
  }

  // 🔁 Common error handler
  Future<T> _tryFirestoreCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } on FormatException {
      throw SFormatException();
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }
}
