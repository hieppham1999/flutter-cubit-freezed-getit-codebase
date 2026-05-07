import 'dart:convert';
import 'package:flutter_cubit_freezed_getit_codebase/app/base/app_logger.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/keys.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/utils/app_shared_preference.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/app_settings/app_settings.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/exceptions/app_exception.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/repositories/app_setting_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AppSettingRepository)
class AppSettingRepositoryImpl implements AppSettingRepository {
  @override
  AppSettings? getAppSetting() {
    final raw = prefs.getString(AppKey.appSetting);
    if (raw == null || raw.isEmpty) return null;
    try {
      return AppSettings.fromJson(jsonDecode(raw));
    } catch (e, stackTrace) {
      appLogger.e('Failed to parse app settings', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> setAppSetting(AppSettings settings) async {
    try {
      await prefs.setString(AppKey.appSetting, jsonEncode(settings.toJson()));
    } catch (e, stackTrace) {
      throw CacheException(
        message: 'Failed to save app settings',
        cause: e,
        stackTrace: stackTrace,
      );
    }
  }
}
