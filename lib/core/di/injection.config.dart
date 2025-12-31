// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_cubit_freezed_getit_codebase/core/di/injection.dart'
    as _i194;
import 'package:flutter_cubit_freezed_getit_codebase/core/utils/app_logger.dart'
    as _i131;
import 'package:flutter_cubit_freezed_getit_codebase/core/utils/app_shared_preference.dart'
    as _i126;
import 'package:flutter_cubit_freezed_getit_codebase/data/datasources/local/database/daos/qr_dao.dart'
    as _i54;
import 'package:flutter_cubit_freezed_getit_codebase/data/datasources/local/database/qr_database.dart'
    as _i387;
import 'package:flutter_cubit_freezed_getit_codebase/data/datasources/local/database/qr_local_data_source.dart'
    as _i493;
import 'package:flutter_cubit_freezed_getit_codebase/data/repositories/app_setting_repository.dart'
    as _i275;
import 'package:flutter_cubit_freezed_getit_codebase/data/repositories/qr_repository.dart'
    as _i721;
import 'package:flutter_cubit_freezed_getit_codebase/domain/repositories/app_setting_repository.dart'
    as _i320;
import 'package:flutter_cubit_freezed_getit_codebase/domain/repositories/qr_repository.dart'
    as _i907;
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/app_setting/app_setting_cubit.dart'
    as _i951;
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_cubit.dart'
    as _i950;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferenceModule = _$SharedPreferenceModule();
    final loggerModule = _$LoggerModule();
    gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
    );
    gh.singleton<_i387.QrDatabase>(() => _i387.QrDatabase());
    gh.factory<_i320.AppSettingRepository>(
      () => _i275.AppSettingRepositoryImpl(),
    );
    gh.lazySingleton<_i974.Logger>(
      () => loggerModule.devLogger,
      registerFor: {_dev},
    );
    gh.singleton<_i951.SettingsCubit>(
      () => _i951.SettingsCubit(gh<_i320.AppSettingRepository>()),
    );
    gh.lazySingleton<_i974.Logger>(
      () => loggerModule.prodLogger,
      registerFor: {_prod},
    );
    gh.factory<_i54.QrDao>(() => _i54.QrDao(gh<_i387.QrDatabase>()));
    gh.singletonAsync<_i126.AppSharedPreference>(
      () async =>
          _i126.AppSharedPreference(await getAsync<_i460.SharedPreferences>()),
      dependsOn: [_i460.SharedPreferences],
    );
    gh.factory<_i493.QrLocalDataSource>(
      () => _i493.QrLocalDataSource(gh<_i54.QrDao>()),
    );
    gh.factory<_i907.QrRepository>(
      () => _i721.QrRepositoryImpl(gh<_i493.QrLocalDataSource>()),
    );
    gh.factory<_i950.QrCreateCubit>(
      () => _i950.QrCreateCubit(gh<_i907.QrRepository>()),
    );
    gh.singleton<_i131.AppLogger>(() => _i131.AppLogger(gh<_i974.Logger>()));
    return this;
  }
}

class _$SharedPreferenceModule extends _i194.SharedPreferenceModule {}

class _$LoggerModule extends _i194.LoggerModule {}
