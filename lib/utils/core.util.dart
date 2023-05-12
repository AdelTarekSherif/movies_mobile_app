import 'package:flutter/material.dart';
import 'package:movies_mobile_app/ui/style/app.dimens.dart';

const double baseWidth = 375.0;

double screenAwareWidth(double size, BuildContext context) {
  double drawingWidth =
      MediaQuery.of(context).size.width - AppDimens.marginDefault16;
  return size * drawingWidth / baseWidth;
}
