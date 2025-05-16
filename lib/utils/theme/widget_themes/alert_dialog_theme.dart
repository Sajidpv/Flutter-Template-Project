import 'package:flutter/material.dart';
import 'package:stock_shift_pro/utils/constants/colors.dart';
import 'package:stock_shift_pro/utils/constants/sizes.dart';

class CustomDialogTheme {
  CustomDialogTheme._();

  static DialogTheme lightDialogTheme = DialogTheme(
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

  static DialogTheme darkDialogTheme = DialogTheme(
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
