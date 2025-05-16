import 'package:flutter/material.dart';
import 'package:stock_shift_pro/utils/constants/colors.dart';
import 'package:stock_shift_pro/utils/constants/sizes.dart';

class CustomCardTheme {
  CustomCardTheme._();

  static CardTheme lightCardTheme = CardTheme(
    color: AppPellet.white,
    elevation: 4,
    margin: const EdgeInsets.all(8),
    shadowColor: Colors.black.withValues(alpha: .1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.xs),
    ),
  );

  static CardTheme darkCardTheme = CardTheme(
    color: AppPellet.grey,
    elevation: 4,
    margin: const EdgeInsets.all(8),
    shadowColor: Colors.white.withValues(alpha: .05),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.xs),
    ),
  );
}
