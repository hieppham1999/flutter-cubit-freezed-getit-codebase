import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/colors.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/typography.dart';

class AppTheme {
  static ThemeData light({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // colorSchemeSeed: seedColor ?? AppColors.defaultThemeColor,
      primaryColor: seedColor ?? AppColors.defaultThemeColor,
      textTheme: appTextTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: seedColor,
      ),
    );
  }

  static ThemeData dark({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // colorSchemeSeed: seedColor ?? AppColors.defaultThemeColor,
      primaryColor: seedColor ?? AppColors.defaultThemeColor,
      textTheme: appTextTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: seedColor,
      ),
    );
  }
}
