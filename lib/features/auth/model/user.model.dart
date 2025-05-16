// ignore_for_file: prefer_collection_literals

import 'package:erp/cors/configs/enums.dart';

class UserResponse {
  bool? success;
  String? message;
  String? token;
  UserModel? user;

  UserResponse({this.success, this.message, this.token, this.user});

  UserResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? name;
  int? mobile;
  String? password;
  UserRole? role;
  StatusEnum? status;
  String? accessCode;
  String? parentId;
  PlanEnum? plan;
  String? planExpiry;
  String? sId;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.name,
    this.mobile,
    this.password,
    this.role,
    this.status,
    this.accessCode,
    this.parentId,
    this.plan,
    this.planExpiry,
    this.sId,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    password = json['password'];
    if (json['role'] != null) {
      role = userRoleFromString(json['role']);
    }
    if (json['status'] != null) {
      status = statusEnumFromString(json['status']);
    }
    accessCode = json['accessCode'] ?? '';
    parentId = json['parentId'];
    plan =
        json['plan'] != null ? planEnumFromString(json['plan']) : json['plan'];
    planExpiry = json['planExpiry'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['mobile'] = mobile;
    data['password'] = password;
    data['role'] = userRoleToString(role);
    data['status'] = statusEnumToString(status);
    data['accessCode'] = accessCode;
    data['parentId'] = parentId;
    data['plan'] = planEnumToString(plan);
    data['planExpiry'] = planExpiry;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
