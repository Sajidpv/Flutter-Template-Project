import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/cors/configs/enums.dart';

class UserModel {
  final String? uid;
  final String name;
  final String email;
  final String mobile;
  final UserRole? role;
  final String? password;
  final bool emailVerified;
  String? photoUrl;

  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.mobile,
    required this.role,
    this.password,
    required this.emailVerified,
    this.photoUrl,
  });

  factory UserModel.fromFirebase(DocumentSnapshot doc, String uid) {
    final data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      return UserModel.empty();
      // throw Exception('User data not found for uid: $uid');
    }

    return UserModel(
      uid: uid,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      mobile: data['mobile'] ?? '',
      role: data['role'] ?? '',
      emailVerified: data['isVerified'] ?? false,
      photoUrl: data['photoUrl'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      role: map['role'],
      password: map['password'] != null ? map['password'] as String : null,
      photoUrl: map['photoUrl'],
      emailVerified: false,
    );
  }

  static UserModel empty() => UserModel(
    uid: '',
    name: '',
    email: '',
    mobile: '',
    role: null,
    photoUrl: '',
    emailVerified: false,
  );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'mobile': mobile,
      'photoUrl': photoUrl,
      'role': role,
    };
  }
}
