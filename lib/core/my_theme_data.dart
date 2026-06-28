import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';

class MyThemeData {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.primaryDark,
      showSelectedLabels: true,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryGold),
    ),
  );
}
