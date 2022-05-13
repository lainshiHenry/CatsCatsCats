import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData lightThemeData = ThemeData(
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );

  ThemeData darkThemeData = ThemeData(
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
  );

  bool get isDarkMode => _isDarkMode;
  ThemeData get getCurrentThemeData =>
      _isDarkMode ? darkThemeData : lightThemeData;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
