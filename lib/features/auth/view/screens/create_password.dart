// import 'package:firebaseapp/cors/configs/app_strings.dart';
// import 'package:firebaseapp/utils/extensions/context_extensions.dart';
// import 'package:firebaseapp/utils/extensions/spacer_extension.dart';
// import 'package:flutter/material.dart';

// class CreatePasswordScreen extends StatelessWidget {
//   const CreatePasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.authBloc;
//     return Scaffold(
//       appBar: AppBar(title: Text(AppStrings.reset), centerTitle: true),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: ListView(
//             children: [
//               Image.asset('assets/reset.jpg', height: 250),
//               40.height,
//               InputPasswordWidget(isSignin: false),
//               divider,
//               InputPasswordWidget(
//                 isConfirm: true,
//                 isSignin: false,
//                 label: 'Confirm your password',
//               ),
//               heightDevider(context.mediaQueryHeight * .05),
//               RoundButton(
//                 loading: provider.loginLoading,
//                 title: AppStrings.submit,
//                 onPress:
//                     provider.loginLoading
//                         ? () {}
//                         : () {
//                           if (provider.password.isEmpty ||
//                               provider.password == '') {
//                             Utils.flushBarMessage(
//                               'Please enter password',
//                               context,
//                             );
//                           } else if (provider.password.length < 6) {
//                             Utils.flushBarMessage(
//                               'Please enter 6 digit password',
//                               context,
//                             );
//                           } else if (provider.confirmpassword.isEmpty ||
//                               provider.confirmpassword == '') {
//                             Utils.flushBarMessage(
//                               'Please confirm password',
//                               context,
//                             );
//                           } else if (provider.confirmpassword.length < 6) {
//                             Utils.flushBarMessage(
//                               'Please enter 6 digit password',
//                               context,
//                             );
//                           } else if (provider.password !=
//                               provider.confirmpassword) {
//                             Utils.flushBarMessage(
//                               'Both password should be same!',
//                               context,
//                             );
//                           } else {
//                             provider.resetPasswordApi(context);
//                           }
//                         },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
