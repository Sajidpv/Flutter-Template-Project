import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_shift_pro/cors/configs/enums.dart';
import 'package:stock_shift_pro/features/auth/view.model/bloc/auth_bloc.dart';
import 'package:stock_shift_pro/routes/route_names.dart';
import 'package:stock_shift_pro/utils/constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          final role = state.user.role;
          if (role == UserRole.admin || role == UserRole.subAdmin) {
            Navigator.pushReplacementNamed(context, RoutesName.admin_home);
          } else if (role == UserRole.user) {
            Navigator.pushReplacementNamed(context, RoutesName.user_home);
          } else {
            Navigator.pushReplacementNamed(context, RoutesName.auth);
          }
        } else if (state is UnauthenticatedState) {
          Navigator.pushReplacementNamed(context, RoutesName.auth);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.appTransparentLogo, width: 200),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
