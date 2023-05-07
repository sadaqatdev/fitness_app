import 'package:fitness_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

var appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.hintColor,
  backgroundColor: AppColors.secondaryColor,
  scaffoldBackgroundColor: AppColors.primaryColor,
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 25,
        color: Colors.black,
        height: 1.5,
        fontWeight: FontWeight.w800),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
    labelSmall: TextStyle(fontSize: 12, color: Colors.black, height: 1.5),
  ),
);
