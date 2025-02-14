import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const lightPrimary = Color(0xFF6200EE);
  static const lightSecondary = Color(0xFF03DAC6);
  static const lightBackground = Color(0xFFF5F5F5);
  static const lightSurface = Colors.white;
  static const lightError = Color(0xFFB00020);
  static const lightSuccess = Color(0xFF4CAF50);
  static const lightTextPrimary = Color(0xFF000000);
  static const lightTextSecondary = Color(0xFF666666);
  static const lightBorder = Color(0xFFE0E0E0);

  // Dark Theme Colors
  static const darkPrimary = Color(0xFFBB86FC);
  static const darkSecondary = Color(0xFF03DAC6);
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkError = Color(0xFFCF6679);
  static const darkSuccess = Color(0xFF81C784);
  static const darkTextPrimary = Color(0xFFFFFFFF);
  static const darkTextSecondary = Color(0xFFAAAAAA);
  static const darkBorder = Color(0xFF2C2C2C);

  // Static colors (same for both themes)
  static const error = Color(0xFFB00020);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFFA000);
  static const info = Color(0xFF2196F3);

  // Get colors based on theme
  static Color get background => isDark ? darkBackground : lightBackground;
  static Color get surface => isDark ? darkSurface : lightSurface;
  static Color get primary => isDark ? darkPrimary : lightPrimary;
  static Color get secondary => isDark ? darkSecondary : lightSecondary;
  static Color get textPrimary => isDark ? darkTextPrimary : lightTextPrimary;
  static Color get textSecondary => isDark ? darkTextSecondary : lightTextSecondary;
  static Color get border => isDark ? darkBorder : lightBorder;

  // Helper to determine if we're in dark mode
  static bool get isDark => ThemeData.estimateBrightnessForColor(background) == Brightness.dark;
}