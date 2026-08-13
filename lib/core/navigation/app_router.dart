import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/navigation/app_routes.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/app_setting/app_setting_page.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_page.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/base/app_logger.dart';
import 'package:get_it/get_it.dart';

class AppRouter {
  /// **Every `MaterialPageRoute` here MUST pass `settings: settings`.**
  ///
  /// `MaterialPageRoute` does not pick up the `RouteSettings` from the
  /// `pushNamed` call that created it — leave `settings:` out and
  /// `route.settings.name` is `null`. Everything keeps working until someone
  /// calls `NavController.popUntil`, which matches `route.settings.name`
  /// against the name to stop at: no route matches, so Navigator pops the whole
  /// stack and leaves a **blank screen**.
  ///
  /// The bug is silent until the first screen uses `popUntil`, so it is easy to
  /// reintroduce with a new route. Keep the parameter on every branch below.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    final logger = GetIt.I<AppLogger>();
    logger.i("Try to open route \"${settings.name}\" with args $args");

    if (args is! AppRoutes) {
      // handle the first page
      if (settings.name == '/') {
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => QrCreatePage(),
        );
      }
      return _errorRoute(settings);
    }

    switch (args) {
      case SettingsRoute():
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AppSettingPage(),
        );
      case QrCreateRoute():
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => QrCreatePage(),
        );
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder:
          (_) => Scaffold(
            body: Center(child: Text(Languages.translate.pageNotFound)),
          ),
    );
  }
}
