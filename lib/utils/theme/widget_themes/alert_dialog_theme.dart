import 'package:flutter/material.dart';
import 'package:erp/utils/constants/colors.dart';
import 'package:erp/utils/constants/sizes.dart';

class CustomDialogTheme {
  CustomDialogTheme._();

  static DialogThemeData lightDialogTheme = DialogThemeData(
    backgroundColor: AppPellet.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.sm),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    contentTextStyle: const TextStyle(fontSize: 14, color: Colors.black87),
  );

  static DialogThemeData darkDialogTheme = DialogThemeData(
    backgroundColor: AppPellet.black,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.sm),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    contentTextStyle: const TextStyle(fontSize: 14, color: Colors.white70),
  );
}
