// import 'package:alfa_bags/configs/app_configs/app_strings.dart';
// import 'package:alfa_bags/configs/app_themes/colors.dart';
// import 'package:alfa_bags/configs/components/rounded_button.dart';
// import 'package:alfa_bags/configs/components/spacer_widgets.dart';
// import 'package:alfa_bags/configs/extensions.dart';
// import 'package:alfa_bags/configs/routes/route_names.dart';
// import 'package:alfa_bags/configs/utils.dart';
// import 'package:alfa_bags/configs/validator/input_validator.dart';
// import 'package:alfa_bags/features/auth/view/widgets/email_field_widget.dart';
// import 'package:alfa_bags/features/auth/view_model/provider/login_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(AppStrings.forgot),
//       ),
//       backgroundColor: AppPellet.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Image.asset(
//                 'assets/forget.jpg',
//                 height: 300,
//               ),
//               divider,
//               InputEmailWidget(),
//               Padding(
//                 padding: const EdgeInsets.only(right: 10.0, top: 5),
//                 child: GestureDetector(
//                     onTap: () => Navigator.pushReplacementNamed(
//                         context, RoutesName.login),
//                     child: Text(
//                       AppStrings.login,
//                       textAlign: TextAlign.end,
//                     )),
//               ),
//               SizedBox(
//                 height: context.mediaQueryHeight * .025,
//               ),
//               Consumer<AuthProvider>(builder: (context, provider, _) {
//                 return RoundButton(
//                   title: AppStrings.next,
//                   loading: provider.loginLoading,
//                   onPress: provider.loginLoading
//                       ? () {}
//                       : () {
//                           if (provider.email.isEmpty) {
//                             Utils.flushBarMessage(
//                                 'Please enter email', context);
//                           } else if (!AppValidator.emailValidator(
//                               provider.email.toString())) {
//                             Utils.flushBarMessage(
//                                 'Please enter valid email', context);
//                           } else {
//                             provider.forgetPasswordApi(context);
//                           }
//                         },
//                 );
//               }),
//               SizedBox(
//                 height: context.mediaQueryHeight * .02,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
