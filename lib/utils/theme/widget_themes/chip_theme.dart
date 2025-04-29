import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomChipTheme {
  CustomChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppPellet.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: AppPellet.black),
    selectedColor: AppPellet.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppPellet.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppPellet.grey,
    labelStyle: TextStyle(color: AppPellet.white),
    selectedColor: AppPellet.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AppPellet.white,
  );
}
