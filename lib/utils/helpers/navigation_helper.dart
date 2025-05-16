import 'package:flutter/material.dart';
import 'package:erp/cors/configs/enums.dart';
import 'package:erp/routes/route_names.dart';

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
    case UserRole.supervisor:
      return RoutesName.supervisor_home;
    case UserRole.master:
      return RoutesName.master_home;
    case UserRole.tailor:
      return RoutesName.tailor_home;
    case UserRole.button:
      return RoutesName.button_home;
    case UserRole.threading:
      return RoutesName.threading_home;
    case UserRole.qc:
      return RoutesName.qc_home;
    case UserRole.customer:
      return RoutesName.customer_home;
    default:
      return RoutesName.login;
  }
}
