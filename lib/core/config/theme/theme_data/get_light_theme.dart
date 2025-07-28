import 'package:flutter/material.dart';
import 'package:to_do_list/core/config/theme/app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.appBarColor,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.txt,
          displayColor: AppColors.txt,
        ),
  );
}
