import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomDropDownTheme {
  CustomDropDownTheme._();

  static DropdownMenuThemeData lightDropDownTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPellet.borderPrimary.withValues(alpha: .5),
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPellet.borderPrimary.withValues(alpha: .1),
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppPellet.borderPrimary, width: 2.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPellet.borderPrimary.withValues(alpha: .5),
          width: 1.0,
        ),
      ),
    ),
  );

  static DropdownMenuThemeData darkDropDownTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPellet.borderPrimary.withValues(alpha: .5),
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPellet.borderPrimary.withValues(alpha: .1),
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppPellet.borderPrimary, width: 2.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppPellet.borderPrimary.withValues(alpha: .5),
          width: 1.0,
        ),
      ),
    ),
  );
}
