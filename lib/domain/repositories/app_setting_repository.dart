import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/app_settings/app_settings.dart';

abstract class AppSettingRepository {
  Future<void> setAppSetting(AppSettings settings);

  AppSettings? getAppSetting();
}
