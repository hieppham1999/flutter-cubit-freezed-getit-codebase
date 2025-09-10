import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/base/base_cubit.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/model/app_language/app_language.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/model/app_settings/app_settings.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/repository/app_setting_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class SettingsCubit extends BaseCubit<AppSettings> {
  SettingsCubit(this.appSettingRepository) : super.normal(AppSettings());

  AppSettingRepository appSettingRepository;

  void loadSetting() {
    final savedSettings = appSettingRepository.getAppSetting();
    if (savedSettings != null) {
      emitNormal(savedSettings);
    }
  }

  void changeLocale(AppLanguage language) async {
    final newAppSetting = currentData.copyWith(language: language);

    await appSettingRepository.setAppSetting(newAppSetting).whenComplete(() {
      emitNormal(newAppSetting);
    });
  }

  Future<void> toggleTheme(ThemeMode mode) async {
    final newAppSetting = currentData.copyWith(themeMode: mode);

    await appSettingRepository.setAppSetting(newAppSetting).whenComplete(() {
      emitNormal(newAppSetting);
    });
  }

  Future<void> changeColorSeed(Color color) async {

    final newAppSetting = currentData.copyWith(colorSchemeSeed: color);

    await appSettingRepository.setAppSetting(newAppSetting).whenComplete(() {
      emitNormal(newAppSetting);
    });
  }

  Future<void> setNotifications(bool enabled) async {

    final newAppSetting = currentData.copyWith(notificationsEnabled: enabled);

    await appSettingRepository.setAppSetting(newAppSetting).whenComplete(() {
      emitNormal(newAppSetting);
    });
  }
}
