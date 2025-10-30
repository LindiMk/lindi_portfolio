import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🌤️ Light Theme
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFe8eaed), // soft grey-blue
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: const TextStyle(fontSize: 16, color: Colors.black87),
      headlineSmall: const TextStyle(fontWeight: FontWeight.bold),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.tealAccent,
      secondary: Colors.deepPurpleAccent,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0.3,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shadowColor: Colors.black26,
      elevation: 4,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  // 🌙 Dark Theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0E0E10), // elegant near-black
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: const TextStyle(fontSize: 16, color: Colors.white70),
      headlineSmall: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.tealAccent,
      secondary: Colors.purpleAccent,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      foregroundColor: Colors.white,
      elevation: 0.3,
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E22),
      shadowColor: Colors.black54,
      elevation: 6,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
