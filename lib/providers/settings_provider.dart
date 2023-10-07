import 'package:audio_app/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setlocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }

  void toggleFav(bool isfav) {
    isfav = !isfav;
  }
}
