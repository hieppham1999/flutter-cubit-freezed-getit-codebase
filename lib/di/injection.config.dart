// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_cubit_freezed_getit_codebase/data/dao/qr_dao.dart'
    as _i227;
import 'package:flutter_cubit_freezed_getit_codebase/data/data_store/qr_local_ds.dart'
    as _i822;
import 'package:flutter_cubit_freezed_getit_codebase/data/database/qr_database.dart'
    as _i5;
import 'package:flutter_cubit_freezed_getit_codebase/data/mapper/qr_view_data_mapper.dart'
    as _i648;
import 'package:flutter_cubit_freezed_getit_codebase/data/repository/app_setting_repository.dart'
    as _i1055;
import 'package:flutter_cubit_freezed_getit_codebase/data/repository/qr_repositories.dart'
    as _i659;
import 'package:flutter_cubit_freezed_getit_codebase/di/injection.dart' as _i12;
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/app_setting/app_setting_cubit.dart'
    as _i951;
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_cubit.dart'
    as _i950;
import 'package:flutter_cubit_freezed_getit_codebase/utils/app_logger.dart'
    as _i126;
import 'package:flutter_cubit_freezed_getit_codebase/utils/app_shared_preference.dart'
    as _i890;
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
    gh.factory<_i648.QrViewDataMapper>(() => _i648.QrViewDataMapper());
    gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferenceModule.prefs,
    );
    gh.singleton<_i5.QrDatabase>(() => _i5.QrDatabase());
    gh.lazySingleton<_i974.Logger>(
      () => loggerModule.devLogger,
      registerFor: {_dev},
    );
    gh.factory<_i1055.AppSettingRepository>(
      () => _i1055.AppSettingRepositoryImpl(),
    );
    gh.singleton<_i951.SettingsCubit>(
      () => _i951.SettingsCubit(gh<_i1055.AppSettingRepository>()),
    );
    gh.factory<_i227.QrDao>(() => _i227.QrDao(gh<_i5.QrDatabase>()));
    gh.factory<_i822.QrLocalDataSource>(
      () => _i822.QrLocalDataSource(gh<_i227.QrDao>()),
    );
    gh.lazySingleton<_i974.Logger>(
      () => loggerModule.prodLogger,
      registerFor: {_prod},
    );
    gh.factory<_i659.QrRepository>(
      () => _i659.QrRepositoryImpl(gh<_i822.QrLocalDataSource>()),
    );
    gh.singletonAsync<_i890.AppSharedPreference>(
      () async =>
          _i890.AppSharedPreference(await getAsync<_i460.SharedPreferences>()),
      dependsOn: [_i460.SharedPreferences],
    );
    gh.factory<_i950.QrCreateCubit>(
      () => _i950.QrCreateCubit(gh<_i659.QrRepository>()),
    );
    gh.singleton<_i126.AppLogger>(() => _i126.AppLogger(gh<_i974.Logger>()));
    return this;
  }
}

class _$SharedPreferenceModule extends _i12.SharedPreferenceModule {}

class _$LoggerModule extends _i12.LoggerModule {}
