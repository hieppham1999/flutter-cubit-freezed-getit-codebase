import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/app.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/di/injection.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/loading.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  await configureDependencies(env);

  /// use only if you want to use database
  // final db = getIt<QrDatabase>();
  // await db.init();

  runApp(MyApp());
  LoadingUtil.setup();

}

