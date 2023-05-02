import 'package:flutter/material.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:movies_mobile_app/ui/style/app.dimens.dart';


const double baseHeight = 812.0;
const double baseWidth = 375.0;

double screenAwareHeight(double size, BuildContext context) {
  double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / baseHeight;
}

double screenAwareSize(double size, BuildContext context) {
  double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / baseHeight;
}

double screenAwareWidth(double size, BuildContext context) {
  double drawingWidth = MediaQuery.of(context).size.width - AppDimens.marginDefault16;
  return size * drawingWidth / baseWidth;
}

class Utils {

  static showSnackBar({
    required context,
    required String message,
    int duration = 1,
    Color color = Colors.white,
    Color backgroundColor = Colors.green,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: color),
        ),
      ),
    );
  }

  static InputDecoration getTextFieldDecoration({required BuildContext context, Widget? suffixIcon}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.primaryColor,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never);
  }

  static void dismissKeyboard(BuildContext context) {
    // Dismiss keyboard
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalizeFirstLetter()).join(' ');
}
