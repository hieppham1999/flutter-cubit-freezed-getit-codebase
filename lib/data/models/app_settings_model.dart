import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/app_settings/app_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/app_settings_model.freezed.dart';
part 'generated/app_settings_model.g.dart';

@freezed
abstract class AppSettingsModel with _$AppSettingsModel implements AppSettings {
  const factory AppSettingsModel({
    @Default(defaultLanguage) AppLanguage language,
    @Default(defaultThemeMode) ThemeMode themeMode,
    @Default(0xFFFFFFFF) int colorSchemeSeed,
    @Default(defaultNotificationsEnabled) bool notificationsEnabled,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
}