import 'package:flutter/material.dart';
import 'package:firebaseapp/utils/constants/colors.dart';

class CustomBottomNavBarTheme {
  CustomBottomNavBarTheme._();

  static BottomNavigationBarThemeData lightBottomNavBarTheme =
      BottomNavigationBarThemeData(
        backgroundColor: AppPellet.white,
        selectedItemColor: AppPellet.primary,
        unselectedItemColor: AppPellet.grey,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 20),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static BottomNavigationBarThemeData darkBottomNavBarTheme =
      BottomNavigationBarThemeData(
        backgroundColor: AppPellet.black,
        selectedItemColor: AppPellet.primary,
        unselectedItemColor: AppPellet.grey,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 20),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );
}
