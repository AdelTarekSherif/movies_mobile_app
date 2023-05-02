import 'package:flutter/material.dart';

import 'app.colors.dart';

class AppTheme {

  static TextStyle headline1 = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.customGreyLevelSubtitle1,
    fontSize: 18,
  );

  static TextStyle headline2 = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.customGreyLevelSubtitle1,
    fontSize: 16,
  );

  static TextStyle headline3 = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.customGreyLevelSubtitle1,
    fontSize: 12,
  );

  static TextStyle headline4 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.customGreyLevelSubtitle1,
    fontSize: 14,
  );

  static TextStyle headline5 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.customGreyLevelSubtitle1,
    fontSize: 20,
  );

  static TextStyle headline6 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.customGreyLevelSubtitle1,
    fontSize: 14,
  );

  static TextStyle button = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 16,
  );

  static TextStyle caption = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.secondryColor,
    fontSize: 14,
  );

  static TextStyle input = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 14,
  );

  static TextStyle body = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 12,
  );

  static TextStyle bodySmall = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    fontSize: 12,
  );

  static TextStyle smallText = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.primaryColor,
    fontSize: 10,
  );

  static double arabicFontExtraPixels = 40;

  static landingTextStyle(context, {bool isBold = false}) => TextStyle(
        fontSize: isBold? 26: 24,
        color: AppColors.customGreyLevelSubtitle1,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      );
}
