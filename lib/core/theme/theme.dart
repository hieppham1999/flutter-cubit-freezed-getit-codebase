import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/colors.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/typography.dart';

class AppTheme {

  AppTheme({
    required this.light,
    required this.dark,
  });

  final ThemeData light;
  final ThemeData dark;


  static ThemeData lightTheme({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // colorSchemeSeed: seedColor ?? AppColors.defaultThemeColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      primaryColor: seedColor ?? AppColors.defaultThemeColor,
      textTheme: AppTypography.defaultTextTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: seedColor,
      ),
    );
  }

  static ThemeData darkTheme({Color? seedColor}) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // colorSchemeSeed: seedColor ?? AppColors.defaultThemeColor,
      primaryColor: seedColor ?? AppColors.defaultThemeColor,
      textTheme: AppTypography.defaultTextTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: seedColor,
      ),
    );
  }
}
