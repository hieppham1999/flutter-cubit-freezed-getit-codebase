import 'package:flutter_cubit_freezed_getit_codebase/app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  asExtension: true, // default
)
Future<void> configureDependencies(String environment) async {
  getIt.init(environment: environment);
  await getIt.allReady();
}

@module
abstract class LoggerModule {
  @prod
  @lazySingleton
  Logger get prodLogger => Logger(
    // Release builds must not print `.d()` / `.i()`. `Logger` defaults to
    // `Level.trace`, which means every state transition of every cubit — state
    // contents included — is written to logcat on real user devices. Keep
    // warnings and above so incidents are still diagnosable.
    level: Level.warning,
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      colors: false,
      printEmojis: false,
    ),
  );

  @dev
  // Must stay in sync with `Flavor.staging.value` — an annotation argument has
  // to be a literal, so it cannot read the enum. Without this the `stg` flavor
  // registers no `Logger` at all, `AppLogger` (a `@singleton` that depends on
  // one) fails to construct, and `configureDependencies` throws before the
  // first frame.
  @Environment('stg')
  @lazySingleton
  Logger get devLogger => Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      colors: true,
      printEmojis: false,
    ),
  );
}

// @Order(-1)
@module
abstract class SharedPreferenceModule {
  @singleton
  Future<SharedPreferences> get prefs async => SharedPreferences.getInstance();

}
