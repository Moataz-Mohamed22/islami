import 'package:flutter/material.dart';
import 'package:islami/utils/appColors.dart';
import 'package:islami/utils/app_styles.dart';

class Mytheme {
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
        selectedLabelStyle: AppStyles.bold14Whtie),
  );
}
