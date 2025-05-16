import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp/features/auth/view.model/bloc/auth_bloc.dart';
import 'package:erp/routes/route_names.dart';
import 'package:erp/utils/constants/app_images.dart';
import 'package:erp/utils/helpers/navigation_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        Timer(const Duration(seconds: 2), () {
          if (state is AuthenticatedState) {
            navigateUserByRole(context, state.user.role);
          }
          if (state is UnauthenticatedState) {
            Navigator.pushReplacementNamed(context, RoutesName.auth);
          }
        });
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
