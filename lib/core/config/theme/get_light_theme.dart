import 'package:flutter/material.dart';
import 'package:to_do_list/core/constant/app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
      //Basic
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,

      //Color Scheme
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: AppColors.primaryColor,
      ),

      //Text Theme
      textTheme: ThemeData.light().textTheme.apply(
            bodyColor: AppColors.txt,
            displayColor: AppColors.txt,
          ),

      //AppBar theme
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor));
}
