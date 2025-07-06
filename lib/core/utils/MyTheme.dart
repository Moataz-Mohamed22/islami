import 'package:flutter/material.dart';

import 'appColors.dart';
import 'app_styles.dart';

class MyTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryDark)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
        selectedLabelStyle: AppStyles.bold14White),
  );
}
