import 'package:flutter/material.dart';
import 'package:firebaseapp/utils/constants/colors.dart';
import 'package:firebaseapp/utils/constants/sizes.dart';

class CustomCardTheme {
  CustomCardTheme._();

  static CardThemeData lightCardTheme = CardThemeData(
    color: AppPellet.white,
    elevation: 4,
    margin: const EdgeInsets.all(8),
    shadowColor: Colors.black.withValues(alpha: .1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.xs),
    ),
  );

  static CardThemeData darkCardTheme = CardThemeData(
    color: AppPellet.grey,
    elevation: 4,
    margin: const EdgeInsets.all(8),
    shadowColor: Colors.white.withValues(alpha: .05),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.xs),
    ),
  );
}
