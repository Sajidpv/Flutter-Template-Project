import 'package:flutter/material.dart';
import 'package:erp/cors/configs/enums.dart';
import 'package:erp/features/auth/view/screens/auth_screen.dart';
import 'package:erp/features/auth/view/screens/signup_screen.dart';
import 'package:erp/features/auth/view/screens/splash_screen.dart';
import 'package:erp/features/home/view/screens/admin_home_screen.dart';
import 'package:erp/features/home/view/screens/user_home_screen.dart';

import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RoutesName.auth:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AuthScreen(),
        );

      case RoutesName.login:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        final UserRole? role = args?['role'] as UserRole?;
        final bool? isLogin = args?['isLogin'] as bool?;
        return MaterialPageRoute(
          builder:
              (BuildContext context) => SignUpScreen(
                role: role ?? UserRole.user,
                isLogin: isLogin ?? false,
              ),
        );

      case RoutesName.user_home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const UserHomeScreen(),
        );
      case RoutesName.admin_home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AdminHomeScreen(),
        );

      // case RoutesName.repor_historyt:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => ReportHistoryScreen());
      // case RoutesName.report:
      //   final EntryModel entry = settings.arguments as EntryModel;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => ReportScreen(entry: entry));
      // case RoutesName.stock_report:
      //   final WarehouseModel godown = settings.arguments as WarehouseModel;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) =>
      //           StockReportScreen(godown: godown));

      // case RoutesName.printing:
      //   final Map<String, dynamic> args =
      //       settings.arguments as Map<String, dynamic>;
      //   final EntryModel? entry = args['entry'] as EntryModel?;
      //   final WarehouseModel? godown = args['godown'] as WarehouseModel?;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => PreviewScreen(
      //             entryDoc: entry,
      //             godownDoc: godown,
      //           ));

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text(RoutesName.no_route)),
            );
          },
        );
    }
  }
}
