// import 'package:alfa_bags/configs/app_configs/app_strings.dart';
// import 'package:alfa_bags/configs/app_themes/colors.dart';
// import 'package:alfa_bags/configs/app_themes/text_styles.dart';
// import 'package:alfa_bags/configs/components/rounded_button.dart';
// import 'package:alfa_bags/configs/components/spacer_widgets.dart';
// import 'package:alfa_bags/configs/extensions.dart';
// import 'package:alfa_bags/configs/routes/route_names.dart';
// import 'package:alfa_bags/configs/utils.dart';
// import 'package:alfa_bags/features/auth/view/components/auth_screen_bottom_text_widget.dart';
// import 'package:alfa_bags/features/auth/view/components/otp_field_widget.dart';
// import 'package:alfa_bags/features/auth/view_model/provider/login_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class OtpVerificationScreen extends StatelessWidget {
//   const OtpVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(
//             20,
//           ),
//           child: ListView(
//             children: [
//               Image.asset(
//                 'assets/verified.jpg',
//                 height: 300,
//               ),
//               divider,
//               Text(
//                 textAlign: TextAlign.center,
//                 'Verification',
//                 style: TextStyles.semiboldLarge(),
//               ),
//               divider,
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     text:
//                         'We\'ve send a verification code to the \nEmail ', // First text
//                     style: TextStyles.mediumSmall(color: AppPellet.grey),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: '  ${context.authProvider.email}', // Second text

//                         style: TextStyles.mediumSmall(),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               heightDevider(
//                 context.mediaQueryHeight * .05,
//               ),
//               PinPutOtpSection(),
//               heightDevider(
//                 context.mediaQueryHeight * .05,
//               ),
//               Consumer<AuthProvider>(builder: (context, provider, _) {
//                 return RoundButton(
//                     title: AppStrings.submit,
//                     loading: provider.loginLoading ? true : false,
//                     onPress: provider.loginLoading
//                         ? () {}
//                         : () {
//                             if (provider.otpFromUser == '' ||
//                                 provider.otpFromUser == 0 ||
//                                 provider.otpFromUser.bitLength < 6) {
//                               Utils.flushBarMessage('Invalid otp', context);
//                             } else {
//                               provider.verifyOtpApi(context);
//                             }
//                           });
//               }),
//               heightDevider(30),
//               Center(
//                 child: AuthScreenBottonTextButtonWidget(
//                     titleText: '',
//                     clickableText: AppStrings.resentOtp,
//                     onClick: () => Navigator.pushReplacementNamed(
//                         context, RoutesName.forgot_password)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
