import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  static late SharedPreferences _sharedPrefThemeObject;
  final ThemeData _purpleTheme = ThemeData(
    primaryColor: Colors.purple,
    primarySwatch: Colors.purple,
    appBarTheme: AppBarTheme(
      color: Colors.purple,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
    ),
    scaffoldBackgroundColor: Colors.purple,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.purple,
    ).copyWith(
      secondary: Colors.purple,
    ),
    useMaterial3: true,
  );
  final ThemeData _greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(
      color: Colors.green,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
    ),
    scaffoldBackgroundColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(
      secondary: Colors.green,
    ),
    useMaterial3: true,
  );

  bool isPurple = true;

  void switchTheme(bool selected) {
    isPurple = selected;
    saveThemeDataToSharedPref(selected);
    notifyListeners();
  }

  ThemeData get selectedThemeData => isPurple ? _purpleTheme : _greenTheme;

  Future<void> createSharedPrefThemeObject() async {
    _sharedPrefThemeObject = await SharedPreferences.getInstance();
  }

  void saveThemeDataToSharedPref(bool value) {
    _sharedPrefThemeObject.setBool('themeData', value);
  }

  void loadThemeDataFromSharedPref() {
    isPurple = _sharedPrefThemeObject.getBool('themeData') ?? true;
    notifyListeners();
  }
}
