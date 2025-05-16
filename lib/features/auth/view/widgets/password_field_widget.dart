// import 'package:alfa_bags/configs/app_themes/colors.dart';
// import 'package:alfa_bags/configs/app_themes/text_styles.dart';
// import 'package:alfa_bags/features/auth/view_model/provider/login_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class InputPasswordWidget extends StatelessWidget {
//   InputPasswordWidget({
//     super.key,
//     this.isSignin = true,
//     this.label = 'Password',
//     this.isConfirm = false,
//   });
//   final bool isSignin, isConfirm;
//   final String? label;
//   final ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthProvider>(builder: (context, provider, child) {
//       return ValueListenableBuilder(
//           valueListenable: _obSecurePassword,
//           builder: (context, value, child) {
//             return TextFormField(
//               obscureText: _obSecurePassword.value,
//               obscuringCharacter: "*",
//               style: TextStyles.regularSmall(),
//               textInputAction: TextInputAction.done,
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//                 hintText: 'Enter password',
//                 labelText: label,
//                 hintStyle: TextStyles.regularSmall(color: AppPellet.grey),
//                 prefixIcon:
//                     isSignin ? const Icon(Icons.lock_open_rounded) : null,
//                 suffixIcon: InkWell(
//                     onTap: () {
//                       _obSecurePassword.value = !_obSecurePassword.value;
//                     },
//                     child: Icon(_obSecurePassword.value
//                         ? Icons.visibility_off_outlined
//                         : Icons.visibility)),
//               ),
//               onChanged: (value) {
//                 if (isConfirm) {
//                   provider.setConfirmPassword(value);
//                 } else {
//                   provider.setPassword(value);
//                 }
//               },
//             );
//           });
//     });
//   }
// }
