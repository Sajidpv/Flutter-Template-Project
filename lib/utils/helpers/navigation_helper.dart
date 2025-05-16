import 'package:flutter/material.dart';
import 'package:erp/cors/configs/enums.dart';
import 'package:erp/routes/route_names.dart';

void navigateUserByRole(BuildContext context, UserRole? role) {
  if (role == UserRole.admin || role == UserRole.subAdmin) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.admin_home,
      (route) => false,
    );
  } else if (role == UserRole.user) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.user_home,
      (route) => false,
    );
  } else {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.auth,
      (route) => false,
    );
  }
}
