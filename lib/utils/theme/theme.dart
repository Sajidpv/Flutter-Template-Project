import 'package:flutter/material.dart';
import 'package:stock_shift_pro/utils/theme/widget_themes/alert_dialog_theme.dart';
import 'package:stock_shift_pro/utils/theme/widget_themes/bottom_navigation_theme.dart';
import 'package:stock_shift_pro/utils/theme/widget_themes/card_theme.dart';
import '../constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/dropdown_button_input_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    disabledColor: AppPellet.grey,
    brightness: Brightness.light,
    primaryColor: AppPellet.primary,
    textTheme: CustomTextTheme.whiteTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppPellet.scafoldBackground,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    bottomNavigationBarTheme: CustomBottomNavBarTheme.lightBottomNavBarTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
    dropdownMenuTheme: CustomDropDownTheme.lightDropDownTheme,
    cardTheme: CustomCardTheme.lightCardTheme,
    dialogTheme: CustomDialogTheme.lightDialogTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    disabledColor: AppPellet.white,
    brightness: Brightness.dark,
    primaryColor: AppPellet.primary,
    textTheme: CustomTextTheme.blackTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppPellet.black,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    bottomNavigationBarTheme: CustomBottomNavBarTheme.darkBottomNavBarTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
    dropdownMenuTheme: CustomDropDownTheme.darkDropDownTheme,
    cardTheme: CustomCardTheme.darkCardTheme,
    dialogTheme: CustomDialogTheme.darkDialogTheme,
  );
}
