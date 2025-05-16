// import 'package:alfa_bags/configs/app_configs/app_strings.dart';
// import 'package:alfa_bags/configs/app_themes/text_styles.dart';
// import 'package:alfa_bags/configs/components/default_textformfield_widget.dart';
// import 'package:alfa_bags/configs/components/spacer_widgets.dart';
// import 'package:alfa_bags/configs/extensions.dart';
// import 'package:alfa_bags/configs/routes/route_names.dart';
// import 'package:alfa_bags/features/auth/view/components/auth_screen_bottom_text_widget.dart';
// import 'package:alfa_bags/features/auth/view/widgets/login_button_widget.dart';
// import 'package:alfa_bags/features/auth/view/widgets/password_field_widget.dart';
// import 'package:flutter/material.dart';

// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({super.key});

//   final emailFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     final provider = context.authProvider;
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         // physics: NeverScrollableScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 AppStrings.signup,
//                 textAlign: TextAlign.center,
//                 style: TextStyles.semiboldLarge(size: 40),
//               ),
//               heightDevider(
//                 context.mediaQueryHeight * .03,
//               ),
//               DefaultTextFormField(
//                 hint: 'Enter name',
//                 label: 'Name',
//                 onChanged: (value) {
//                   provider.setName(value);
//                 },
//               ),
//               divider,
//               DefaultTextFormField(
//                 hint: 'Enter phone',
//                 label: 'Phone',
//                 textInputType: TextInputType.phone,
//                 onChanged: (value) {
//                   provider.setPhone(value);
//                 },
//               ),
//               divider,
//               DefaultTextFormField(
//                 hint: 'Enter emergency phone',
//                 textInputType: TextInputType.phone,
//                 label: 'Emergency phone',
//                 onChanged: (value) {
//                   provider.setEPhone(value);
//                 },
//               ),
//               divider,
//               DefaultTextFormField(
//                 hint: 'Enter address',
//                 label: 'Address',
//                 onChanged: (value) {
//                   provider.setAddress(value);
//                 },
//               ),
//               divider,
//               DefaultTextFormField(
//                 hint: 'Enter pincode',
//                 label: 'Pincode',
//                 textInputType: TextInputType.number,
//                 onChanged: (value) {
//                   provider.setPincode(value);
//                 },
//               ),
//               divider,
//               DefaultTextFormField(
//                 hint: 'Enter email',
//                 label: 'Email',
//                 textInputType: TextInputType.emailAddress,
//                 onChanged: (value) {
//                   provider.setEmail(value);
//                 },
//               ),
//               divider,
//               InputPasswordWidget(
//                 isSignin: false,
//               ),
//               divider,
//               DefaultTextFormField(
//                 hint: 'Enter identifier',
//                 label: 'Identifier',
//                 onChanged: (value) {
//                   provider.setIdentifier(value);
//                 },
//               ),
//               heightDevider(
//                 context.mediaQueryHeight * .03,
//               ),
//               const LoginButtonWidget(
//                 isLogin: false,
//               ),
//               heightDevider(
//                 context.mediaQueryHeight * .05,
//               ),
//               Center(
//                 child: AuthScreenBottonTextButtonWidget(
//                     titleText: AppStrings.alredyRegistered,
//                     clickableText: AppStrings.login,
//                     onClick: () => Navigator.pushReplacementNamed(
//                         context, RoutesName.login)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
