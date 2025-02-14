import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle getHeadline1(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.lightTextPrimary
          : AppColors.darkTextPrimary,
    );
  }

  static TextStyle getHeadline2(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.lightTextPrimary
          : AppColors.darkTextPrimary,
    );
  }

  static TextStyle getBodyText1(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.lightTextPrimary
          : AppColors.darkTextPrimary,
    );
  }
  // Additional styles
  static TextStyle bodyText2(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      fontSize: 14,
      color: theme.brightness == Brightness.light
          ? AppColors.lightTextSecondary
          : AppColors.darkTextSecondary,
    );
  }

  static TextStyle button(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: theme.brightness == Brightness.light
          ? AppColors.lightTextPrimary
          : AppColors.darkTextPrimary,
    );
  }

  static TextStyle caption(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      fontSize: 12,
      color: theme.brightness == Brightness.light
          ? AppColors.lightTextSecondary
          : AppColors.darkTextSecondary,
    );
  }
}