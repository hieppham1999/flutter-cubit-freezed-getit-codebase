import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/app_settings.freezed.dart';
part 'generated/app_settings.g.dart';


const defaultLanguage = AppLanguage.en;
const defaultThemeMode = ThemeMode.dark;
const defaultColorScheme = Colors.purple;
const defaultNotificationsEnabled = true;

@freezed
abstract class AppSettings with _$AppSettings {

const AppSettings._();

  const factory AppSettings({
    @Default(defaultLanguage) AppLanguage language,
    @Default(defaultThemeMode) ThemeMode themeMode,
    @Default(0xFFFFFFFF) int colorSchemeSeed,
    @Default(defaultNotificationsEnabled) bool notificationsEnabled,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}