import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../helpers/size_helper_function.dart';

/// Custom Class for white & black Text Themes
class CustomTextTheme {
  CustomTextTheme._(); // To avoid creating instances

  /// Customizable white Text Theme
  static TextTheme whiteTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(24.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(24.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(24.0),
      fontWeight: FontWeight.w200,
      color: AppPellet.black,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(18.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.black,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(18.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.black,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(18.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.black,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(14.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.black,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(14.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.black,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(14.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.black,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(10.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(10.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.black,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(10.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.black,
    ),
  );

  /// Customizable black Text Theme
  static TextTheme blackTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(24.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(24.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(24.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.white,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(18.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.white,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(18.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.white,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(18.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.white,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(14.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.white,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(14.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.white,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(14.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.white,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(10.0),
      fontWeight: FontWeight.bold,
      color: AppPellet.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(10.0),
      fontWeight: FontWeight.normal,
      color: AppPellet.white,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(10.0),
      fontWeight: FontWeight.w300,
      color: AppPellet.white,
    ),
  );
}
