// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  language:
      $enumDecodeNullable(_$AppLanguageEnumMap, json['language']) ??
      defaultLanguage,
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      defaultThemeMode,
  colorTheme:
      $enumDecodeNullable(_$AppColorThemeEnumMap, json['colorTheme']) ??
      defaultColorScheme,
  notificationsEnabled:
      json['notificationsEnabled'] as bool? ?? defaultNotificationsEnabled,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'language': _$AppLanguageEnumMap[instance.language]!,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'colorTheme': _$AppColorThemeEnumMap[instance.colorTheme]!,
      'notificationsEnabled': instance.notificationsEnabled,
    };

const _$AppLanguageEnumMap = {AppLanguage.en: 'en', AppLanguage.vi: 'vi'};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$AppColorThemeEnumMap = {AppColorTheme.green: 'green'};
