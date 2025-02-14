import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themePreferenceKey = 'theme_preference';
  final SharedPreferences _prefs;
  bool _isDarkMode;

  ThemeProvider(this._prefs) : _isDarkMode = false {
    _loadThemePreference();
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemePreference();
    notifyListeners();
  }

  void _loadThemePreference() {
    _isDarkMode = _prefs.getBool(_themePreferenceKey) ?? false;
    notifyListeners();
  }

  void _saveThemePreference() {
    _prefs.setBool(_themePreferenceKey, _isDarkMode);
  }
}