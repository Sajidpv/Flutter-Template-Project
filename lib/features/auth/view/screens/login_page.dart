// import 'package:alfa_bags/configs/app_configs/app_strings.dart';
// import 'package:alfa_bags/configs/components/spacer_widgets.dart';
// import 'package:alfa_bags/configs/extensions.dart';
// import 'package:alfa_bags/configs/routes/route_names.dart';
// import 'package:alfa_bags/features/auth/view/components/auth_screen_bottom_text_widget.dart';
// import 'package:alfa_bags/features/auth/view/widgets/email_field_widget.dart';
// import 'package:alfa_bags/features/auth/view/widgets/login_button_widget.dart';
// import 'package:alfa_bags/features/auth/view/widgets/password_field_widget.dart';
// import 'package:flutter/material.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();

//   @override
//   void dispose() {
//     super.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Image.asset(
//                   'assets/logins.png',
//                   height: 200,
//                 ),
//                 heightDevider(30),
//                 InputEmailWidget(
//                     focusNode: emailFocusNode,
//                     passwordFocusNode: passwordFocusNode),
//                 heightDevider(
//                   context.mediaQueryHeight * .02,
//                 ),
//                 InputPasswordWidget(),
//                 divider,
//                 GestureDetector(
//                     onTap: () => Navigator.pushReplacementNamed(
//                         context, RoutesName.forgot_password),
//                     child: Text(
//                       AppStrings.forgot,
//                       textAlign: TextAlign.end,
//                     )),
//                 heightDevider(60),
//                 const LoginButtonWidget(),
//                 heightDevider(
//                   context.mediaQueryHeight * .05,
//                 ),
//                 Center(
//                   child: AuthScreenBottonTextButtonWidget(
//                       titleText: AppStrings.dontRegister,
//                       clickableText: '${AppStrings.register} Now',
//                       onClick: () => Navigator.pushReplacementNamed(
//                           context, RoutesName.register)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
