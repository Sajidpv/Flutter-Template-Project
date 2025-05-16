import 'package:flutter/material.dart';
import 'package:stock_shift_pro/cors/configs/enums.dart';
import 'package:stock_shift_pro/routes/route_names.dart';

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
