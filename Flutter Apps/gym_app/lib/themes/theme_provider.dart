import 'package:flutter/material.dart';
import 'package:gym_app/themes/dark_mode.dart';
import 'package:gym_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = darkMode;
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = isDarkMode ? lightMode : darkMode;
    notifyListeners();
  }
}
