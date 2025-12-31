import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';

const defaultLanguage = AppLanguage.en;
const defaultThemeMode = ThemeMode.dark;
const defaultColorScheme = Colors.purple;
const defaultNotificationsEnabled = true;

abstract interface class AppSettings {
  AppLanguage get language;
  ThemeMode get themeMode;
  int get colorSchemeSeed;
  bool get notificationsEnabled;

  Map<String, dynamic> toJson();
}
