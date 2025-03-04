import 'package:dem/utilities/sharedpreference.dart';
import 'package:dem/utilities/themes.dart';
import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightmode;
 Themeprovider({bool initialDarkMode = false}) {
    if (initialDarkMode) {
      _themeData = darkmode;
    }
  }
  ThemeData get themeData => _themeData;

  bool get isdarkmode => _themeData == darkmode;

  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    notifyListeners();
  }

 void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
      SharedPreferencesHelper.savemodeStatus(true);
    } else {
      themeData = lightmode;
      SharedPreferencesHelper.savemodeStatus(false);
      
    }
  }
}
