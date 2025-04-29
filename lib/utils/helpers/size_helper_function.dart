import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stock_shift_pro/utils/constants/sizes.dart';

class SizeHelper {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static void init(BuildContext context) {
    screenWidth = context.width;
    screenHeight = context.height;
  }

  static double getFontSize(double size) {
    if (screenWidth < AppSizes.mobileScreenSize) {
      return size * 0.85;
    } else if (screenWidth < AppSizes.tabletScreenSize) {
      return size; // Normal phones
    } else {
      return size * 1.2; // Tablets
    }
  }

  static double getIconSize(double size) {
    return getFontSize(size);
  }

  static double getContainerSize(double size) {
    return getFontSize(size);
  }

  static double getCardSize(double size) {
    return getFontSize(size);
  }
}
