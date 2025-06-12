import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String mobile;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory UserModel.fromFirebase(DocumentSnapshot doc, String uid) {
    final data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('User data not found for uid: $uid');
    }

    return UserModel(
      uid: uid,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      mobile: data['mobile'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'name': name, 'email': email, 'mobile': mobile};
  }
}
