import 'package:flutter/cupertino.dart';
import 'package:peduli_lindungi_copy/templates/app_color.dart';

class AppTextStyle {
  static TextStyle blackContent({
    double size = 14,
    FontWeight weight = FontWeight.normal,
  }) =>
      TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: AppColor.blackColor,
      );
}
