import 'package:flutter/material.dart';

/// Design tokens for AURA_Gold application theme.
class AppTheme {
  AppTheme._();

  // Premium Gold / Charcoal Palette
  static const Color primaryGold = Color(0xFFFFD700); // Metallic Gold
  static const Color goldAccent = Color(0xFFFFC107);  // Warm Gold
  static const Color deepCharcoal = Color(0xFF1C1C1E); // Apple system dark gray
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color creamBackground = Color(0xFFFAF9F6); // Soft warm white

  /// Material 3 Light Color Scheme
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryGold,
    brightness: Brightness.light,
    primary: const Color(0xFF725C00),
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFFFFE084),
    onPrimaryContainer: const Color(0xFF231B00),
    secondary: const Color(0xFF675E40),
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xFFEFE2BF),
    onSecondaryContainer: const Color(0xFF211B04),
    surface: creamBackground,
    onSurface: const Color(0xFF1D1B16),
  );

  /// Material 3 Dark Color Scheme
  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryGold,
    brightness: Brightness.dark,
    primary: primaryGold,
    onPrimary: const Color(0xFF3C2F00),
    primaryContainer: const Color(0xFF564500),
    onPrimaryContainer: const Color(0xFFFFE084),
    secondary: const Color(0xFFD2C6A4),
    onSecondary: const Color(0xFF373016),
    secondaryContainer: const Color(0xFF4E472B),
    onSecondaryContainer: const Color(0xFFEFE2BF),
    surface: const Color(0xFF121212),
    onSurface: const Color(0xFFE6E2D9),
  );

  /// Returns the configured light ThemeData
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.surface,
        foregroundColor: lightColorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: lightColorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightColorScheme.primary,
          foregroundColor: lightColorScheme.onPrimary,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Returns the configured dark ThemeData
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.surface,
        foregroundColor: darkColorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: darkColorScheme.surface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          foregroundColor: darkColorScheme.onPrimary,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
