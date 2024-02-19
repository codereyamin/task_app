import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const textStyle1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static const textStyle2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const textStyle3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
}
