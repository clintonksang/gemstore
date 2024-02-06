import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';

class AppTextStyle {
  static TextStyle title({Color? color}) {
    return TextStyle(
      fontFamily: 'ProductSans',

      fontWeight: FontWeight.w700,
      fontSize: 25,
      color:
          color ?? AppColors().secondaryColor, // Default color if none provided
    );
  }

  static TextStyle subtitle({Color? color}) {
    return TextStyle(
      fontFamily: 'ProductSans',

      fontWeight: FontWeight.w700,
      fontSize: 16,
      color:
          color ?? AppColors().secondaryColor, // Default color if none provided
    );
  }
}
