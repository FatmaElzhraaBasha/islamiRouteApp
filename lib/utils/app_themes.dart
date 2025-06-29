import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackbgColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
