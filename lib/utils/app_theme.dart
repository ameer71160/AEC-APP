import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1A237E);
  static const Color primaryGradientStart = Color(0xFF1A237E);
  static const Color primaryGradientEnd = Color(0xFF0D47A1);
  static const Color textSecondary = Color(0xFF757575);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    ),
  );

  static TextStyle get headingStyle => const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
}
