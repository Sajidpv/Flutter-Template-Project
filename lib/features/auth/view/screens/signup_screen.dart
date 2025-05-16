import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_shift_pro/cors/configs/app_strings.dart';
import 'package:stock_shift_pro/cors/configs/enums.dart';
import 'package:stock_shift_pro/cors/widgets/buttons/material_button.dart';
import 'package:stock_shift_pro/cors/widgets/inputs/texts/text_fields.dart';
import 'package:stock_shift_pro/features/auth/model/user.model.dart';
import 'package:stock_shift_pro/features/auth/view.model/bloc/auth_bloc.dart';
import 'package:stock_shift_pro/features/auth/view.model/services/session_services.dart';
import 'package:stock_shift_pro/features/auth/view/widgets/logo_with_title.dart';
import 'package:stock_shift_pro/routes/route_names.dart';
import 'package:stock_shift_pro/utils/constants/colors.dart';
import 'package:stock_shift_pro/utils/constants/sizes.dart';
import 'package:stock_shift_pro/utils/extensions/context_extensions.dart';
import 'package:stock_shift_pro/utils/helpers/navigation_helper.dart';
import 'package:stock_shift_pro/utils/popups/utils.dart';
import 'package:stock_shift_pro/utils/validators/validation.dart';

class SignUpScreen extends StatelessWidget {
  final UserRole role;
  final bool isLogin;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController accesscodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpScreen({super.key, required this.role, this.isLogin = false});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          Utils.flushBarMessage(state.error, context);
        }
        if (state is AuthSuccessState) {
          Utils.toastMessage(
            'Registration completed! Please login to continue.',
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.login,
            arguments: {'isLogin': true},
            (route) => false,
          );
        }
        if (state is AuthenticatedState) {
          navigateUserByRole(context, state.user.role);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return LogoWithTitle(
                title: AppStrings.appTitle,
                subText: isLogin ? 'Welcome back!' : "Let us know who you are!",
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: AppSizes.defaultSpace,
                      children: [
                        if (!isLogin)
                          CustomTextFormField(
                            style: context.bodyMedium,
                            textController: nameController,
                            validator: SValidator.validateName,
                            hintText: 'Full Name',
                          ),
                        CustomTextFormField(
                          style: context.bodyMedium,
                          textController: phoneController,
                          textInputType: TextInputType.phone,
                          validator: SValidator.validateMobile,
                          hintText: 'Phone Number',
                        ),
                        if (!isLogin)
                          CustomTextFormField(
                            style: context.bodyMedium,
                            textController: accesscodeController,
                            hintText: 'Access Code (Optional)',
                          ),
                        CustomTextFormField(
                          style: context.bodyMedium,
                          textController: passwordController,

                          validator: SValidator.validatePassword,
                          hintText: 'Password',
                        ),

                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoadingState) {
                              return CircularProgressIndicator().toCenter();
                            }
                            return MaterialButtonWidget(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  context.authBloc.add(
                                    isLogin
                                        ? LoggedInEvent(
                                          mobile: phoneController.text.trim(),
                                          deviceToken:
                                              SessionController().fcmToken ??
                                              '',
                                          password:
                                              passwordController.text.trim(),
                                        )
                                        : SignUpEvent(
                                          user: UserModel(
                                            name: nameController.text,
                                            mobile: int.parse(
                                              phoneController.text,
                                            ),
                                            role: role,
                                            accessCode:
                                                accesscodeController.text
                                                    .trim(),
                                            password:
                                                passwordController.text.trim(),
                                          ),
                                        ),
                                  );
                                }
                              },
                              title: isLogin ? 'Login' : 'Register',
                            );
                          },
                        ),
                        MaterialButtonWidget(
                          color: Colors.transparent,
                          textColor:
                              context.isDark
                                  ? AppPellet.white
                                  : AppPellet.black,
                          onPressed:
                              () =>
                                  isLogin
                                      ? Navigator.pushNamed(
                                        context,
                                        RoutesName.auth,
                                      )
                                      : Navigator.pushNamed(
                                        context,
                                        RoutesName.login,
                                        arguments: {'isLogin': true},
                                      ),
                          title:
                              isLogin
                                  ? 'Don\'t have an account? Register now.'
                                  : 'Already registered? Login to continue.',
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
