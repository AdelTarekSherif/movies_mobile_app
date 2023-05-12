import 'package:flutter/material.dart';

import 'app.colors.dart';

class AppTheme {
  static landingTextStyle(context, {bool isBold = false}) => TextStyle(
        wordSpacing: 3,
        fontSize: isBold ? 26 : 24,
        color: AppColors.customGreyLevelSubtitle1,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
      );
}
