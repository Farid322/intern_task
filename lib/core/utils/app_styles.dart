import 'package:flutter/material.dart';

import 'app_colors.dart';


abstract class AppStyles {
  static const s16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const s12 = TextStyle(
    fontSize: 12,
    color: AppColors.greyForText,
    fontWeight: FontWeight.w500,
  );
}
