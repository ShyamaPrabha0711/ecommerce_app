import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Lufga';

  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static const TextStyle link = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
    decoration: TextDecoration.underline,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle whiteBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle sectionHeader = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const TextStyle categoryLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle productName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const TextStyle productCategory = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const TextStyle price = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static const TextStyle oldPrice = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle bannerTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle bannerSubTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}
