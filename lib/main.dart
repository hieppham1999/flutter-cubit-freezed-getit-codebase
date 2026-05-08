import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/app.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/di/injection.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/config/environment.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/loading.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.current = AppConfig.fromEnvironment();

  await configureDependencies(AppConfig.current.flavor.value);

  runApp(MyApp());
  LoadingUtil.setup();
}
