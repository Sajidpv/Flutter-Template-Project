import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../helpers/size_helper_function.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    fillColor: AppPellet.white,
    filled: true,
    prefixIconColor: AppPellet.grey,
    suffixIconColor: AppPellet.grey,
    // constraints: const BoxConstraints.expand(height: AppSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(AppSizes.fontSizeSm),
      color: AppPellet.grey.withValues(alpha: .8),
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(AppSizes.fontSizeSm),
      color: AppPellet.grey,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppPellet.primary.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: BorderSide(
        width: 1,
        color: AppPellet.grey.withValues(alpha: .4),
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: BorderSide(
        width: 1,
        color: AppPellet.grey.withValues(alpha: .4),
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: BorderSide(width: 1, color: AppPellet.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: AppPellet.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 2, color: AppPellet.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppPellet.grey,
    suffixIconColor: AppPellet.grey,
    // constraints: const BoxConstraints.expand(height: AppSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(AppSizes.fontSizeSm),
      color: AppPellet.grey,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: SizeHelper.getFontSize(AppSizes.fontSizeSm),
      color: AppPellet.grey,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppPellet.primary.withValues(alpha: 0.4),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: AppPellet.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: AppPellet.borderPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: BorderSide(width: 1, color: AppPellet.grey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 1, color: AppPellet.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldMinimumRadius),
      borderSide: const BorderSide(width: 2, color: AppPellet.warning),
    ),
  );
}
