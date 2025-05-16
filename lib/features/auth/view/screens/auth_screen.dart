import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:erp/cors/configs/app_strings.dart';
import 'package:erp/cors/configs/enums.dart';
import 'package:erp/cors/widgets/buttons/material_button.dart';
import 'package:erp/features/auth/view/widgets/logo_with_title.dart';
import 'package:erp/routes/route_names.dart';
import 'package:erp/utils/constants/colors.dart';
import 'package:erp/utils/constants/sizes.dart';
import 'package:erp/utils/extensions/spacer_extension.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return LogoWithTitle(
              title: AppStrings.appTitle,
              subText: "",

              children: [
                Spacer(),
                MaterialButtonWidget(
                  onPressed:
                      () => Navigator.pushNamed(
                        context,
                        RoutesName.login,
                        arguments: {'role': UserRole.admin},
                      ),
                  title: 'Sign up as Admin',
                ),
                16.height,
                MaterialButtonWidget(
                  onPressed:
                      () => Navigator.pushNamed(
                        context,
                        RoutesName.login,
                        arguments: {'role': UserRole.user},
                      ),
                  title: 'Sign up as User',
                ),
                16.height,
                MaterialButtonWidget(
                  color: Colors.transparent,
                  textColor: context.isDark ? AppPellet.white : AppPellet.black,
                  onPressed:
                      () => Navigator.pushNamed(
                        context,
                        RoutesName.login,
                        arguments: {'isLogin': true},
                      ),
                  title: 'Already registered? Login to continue.',
                ),
              ],
            ).paddingVertical(AppSizes.defaultSpace);
          },
        ),
      ),
    );
  }
}
