import 'package:flutter/material.dart';
import '../colors/color.dart';

class ThemeManager {
  static ThemeManager? _instance;
  late ThemeData _themeData;
  ThemeManager._internal() {
    _themeData = ThemeData.light();
  }

  factory ThemeManager() {
    if (_instance == null) {
      _instance = ThemeManager._internal();
    }
    return _instance!;
  }
  void setTheme(ThemeData themeData) {
    _themeData = themeData;
  }

  ThemeData get themeData => _themeData;
}

class AppTheme {
  static lightTheme() => ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              color: textBlack, fontSize: 28, fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
            color: bodySmallText,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          displaySmall: TextStyle(
            color: greyishText,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: TextStyle(
            color: bodySmallText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: blue,
          ),
          labelSmall: TextStyle(
            color: bodySmallText,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: TextStyle(
            color: greyishText,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      );
}
