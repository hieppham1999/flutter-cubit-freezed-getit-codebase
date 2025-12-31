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
  await getIt.allReady();
  getIt.init(environment: environment);

}

@module
abstract class LoggerModule {
  @prod
  @lazySingleton
  Logger get prodLogger => Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      colors: false,
      printEmojis: false,
    ),
  );

  @dev
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
