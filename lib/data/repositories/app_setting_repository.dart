import 'dart:convert';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/keys.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/app_settings/app_settings.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/repositories/app_setting_repository.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/utils/app_shared_preference.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AppSettingRepository)
class AppSettingRepositoryImpl implements AppSettingRepository {
  @override
  AppSettings? getAppSetting() {
    try {
      return AppSettings.fromJson(
        jsonDecode(prefs.getString(AppKey.appSetting) ?? ''),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> setAppSetting(AppSettings settings) async {
    prefs.setString(AppKey.appSetting, jsonEncode(settings.toJson()));
  }
}
