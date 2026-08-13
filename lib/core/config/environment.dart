import 'package:flutter_cubit_freezed_getit_codebase/core/constants/constants.dart';

/// Build flavors. The active flavor is selected at app start via
/// `--dart-define-from-file=env/<flavor>.json` (see `main.dart`) and
/// propagated to GetIt via `injectable`'s `@Environment(...)` annotations.
///
/// These [value]s are the shared name of a flavor across the whole project —
/// the `env/<value>.json` file, the Android product flavor in
/// `android/app/build.gradle.kts`, and the `@Environment('<value>')` bindings in
/// `app/di/injection.dart` all have to spell it the same way.
enum Flavor {
  dev('dev'),
  staging('stg'),
  prod('prod');

  const Flavor(this.value);
  final String value;

  static Flavor fromString(String value) {
    return Flavor.values.firstWhere(
      (f) => f.value == value,
      orElse: () => Flavor.dev,
    );
  }
}

/// Per-flavor application configuration. Values are sourced from
/// `env/<flavor>.json` at compile time via `--dart-define-from-file`.
/// Mutable globals are confined to [AppConfig.current] which is set once
/// at startup before `runApp`.
class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.enableLogging,
    required this.enableCrashReporting,
  });

  final Flavor flavor;
  final String appName;
  final String apiBaseUrl;
  final bool enableLogging;
  final bool enableCrashReporting;

  bool get isDev => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProd => flavor == Flavor.prod;

  static late AppConfig current;

  /// Builds [AppConfig] from compile-time `--dart-define` values injected
  /// from `env/<flavor>.json`. Defaults match `env/dev.json` so the app
  /// still runs if no env file is supplied.
  factory AppConfig.fromEnvironment() {
    const flavorValue = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    const appName = String.fromEnvironment('APP_NAME');
    const apiBaseUrl = String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://dev.example.com',
    );
    const enableLogging = bool.fromEnvironment(
      'ENABLE_LOGGING',
      defaultValue: true,
    );
    const enableCrashReporting = bool.fromEnvironment(
      'ENABLE_CRASH_REPORTING',
    );

    return AppConfig(
      flavor: Flavor.fromString(flavorValue),
      appName: appName.isEmpty
          ? '${flavorValue.toUpperCase()} ${Constants.appName}'
          : appName,
      apiBaseUrl: apiBaseUrl,
      enableLogging: enableLogging,
      enableCrashReporting: enableCrashReporting,
    );
  }
}
