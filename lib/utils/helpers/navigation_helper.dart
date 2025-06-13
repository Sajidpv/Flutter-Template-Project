import 'package:flutter/material.dart';
import 'package:firebaseapp/cors/configs/enums.dart';
import 'package:firebaseapp/routes/route_names.dart';

void navigateUserByRole(BuildContext context, UserRole? role) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    getHomeScreen(role),
    (route) => false,
  );
}

String getHomeScreen(UserRole? role) {
  switch (role) {
    case UserRole.admin:
      return RoutesName.admin_home;
    case UserRole.subAdmin:
      return RoutesName.admin_home;
    case UserRole.user:
      return RoutesName.user_home;
    default:
      return RoutesName.login;
  }
}
