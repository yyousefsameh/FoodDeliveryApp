import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/utils/cache_preferences_service.dart';
import 'package:food_delivery_app/utils/themes_manager.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = isDark ? AppThemes.darkMode : AppThemes.lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == AppThemes.darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    isDark = !isDark;
    if (_themeData == AppThemes.lightMode) {
      _themeData = AppThemes.darkMode;
    } else {
      _themeData = AppThemes.lightMode;
    }
    CacheService.saveData(key: "isDark", value: isDark);
    // same to set state
    notifyListeners();
  }
}
