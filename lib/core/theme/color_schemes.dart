// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_cubit_freezed_getit_codebase/core/theme/typography.dart';
import 'package:flutter/material.dart';

enum AppColorTheme {
  green;

  Color get exampleColor {
    return switch (this) {
      AppColorTheme.green => Colors.green,
    };
  }

  ThemeData getThemeData(bool isDarkTheme) {
    final _colorScheme = getColorScheme(isDarkTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: _colorScheme.brightness,
      colorScheme: _colorScheme,
      textTheme: AppTypography.defaultTextTheme,
    );
  }

  ColorScheme getColorScheme(bool isDarkTheme) {
    return switch (this) {
      AppColorTheme.green =>
        isDarkTheme ? _AppColorSchemes.greenDark : _AppColorSchemes.greenLight,
    };
  }
}

class _AppColorSchemes {
  static const ColorScheme greenLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF66C2A5),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEAF9F3),
    onPrimaryContainer: Color(0xFF002117),
    secondary: Color(0xFF516356),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD4E8D7),
    onSecondaryContainer: Color(0xFF0E1F15),
    tertiary: Color(0xFF3F6374),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC3E8FC),
    onTertiaryContainer: Color(0xFF001E2B),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFF1A1C1B),
    onSurfaceVariant: Color(0xFF404841),
    outline: Color(0xFF707970),
    outlineVariant: Color(0xFFC0C8C0),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF2F3130),
    inversePrimary: Color(0xFF88D6AC),
    surfaceTint: Color(0xFF66C2A5),
    surfaceContainer: Color(0xFFFFFFFF),
    surfaceContainerHigh: Color(0xFFE0E4E0),
  );

  static const ColorScheme greenDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF88D6AC),
    onPrimary: Color(0xFF003826),
    primaryContainer: Color(0xFF005238),
    onPrimaryContainer: Color(0xFFEAF9F3),
    secondary: Color(0xFFB8CCBF),
    onSecondary: Color(0xFF23352A),
    secondaryContainer: Color(0xFF394B3F),
    onSecondaryContainer: Color(0xFFD4E8D7),
    tertiary: Color(0xFF8FCCE9),
    onTertiary: Color(0xFF003545),
    tertiaryContainer: Color(0xFF1D4C5F),
    onTertiaryContainer: Color(0xFFC3E8FC),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF18181B),
    onSurface: Color(0xFFE2E3E2),
    onSurfaceVariant: Color(0xFFC0C8C0),
    outline: Color(0xFF8A928A),
    outlineVariant: Color(0xFF404841),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE2E3E2),
    inversePrimary: Color(0xFF006D52),
    surfaceTint: Color(0xFF88D6AC),
    surfaceContainer: Color(0xFF27272A),
    surfaceContainerHigh: Color(0xFF232D36),
  );
}
