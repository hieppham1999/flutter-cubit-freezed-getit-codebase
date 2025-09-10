import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/base/bloc_state_builder.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/model/app_settings/app_settings.dart';
import 'package:flutter_cubit_freezed_getit_codebase/di/injection.dart';
import 'package:flutter_cubit_freezed_getit_codebase/navigation/app_navigator.dart';
import 'package:flutter_cubit_freezed_getit_codebase/navigation/app_router.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/app_setting/app_setting_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment('env', defaultValue: 'dev');
  await configureDependencies(env);

  /// use only if you want to use database
  // final db = getIt<QrDatabase>();
  // await db.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settingCubit = getIt.get<SettingsCubit>();

  @override
  void initState() {
    settingCubit.loadSetting();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CubitStateBuilder<AppSettings>(
      cubit: settingCubit,

      builder: (_,state) => MaterialApp(
        title: 'QR Generator Flutter',
        navigatorKey: NavigatorKey.key,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        themeMode: state.themeMode,
        theme: AppTheme.light(seedColor: state.colorSchemeSeed),
        darkTheme: AppTheme.dark(seedColor: state.colorSchemeSeed),
        locale: state.language.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}