import 'package:flutter/material.dart';

class ColorThemeData with ChangeNotifier {
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

  ThemeData _selectedThemeData = ThemeData(
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

  void switchTheme(bool selected) {
    _selectedThemeData = selected ? _purpleTheme : _greenTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
