import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/navigation/app_routes.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/app_setting/app_setting_page.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_page.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/base/app_logger.dart';
import 'package:get_it/get_it.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    final logger = GetIt.I<AppLogger>();
    logger.i("Try to open route \"${settings.name}\" with args $args");

    if (args is! AppRoutes) {
      // handle the first page
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (_) => QrCreatePage());
      }
      return _errorRoute();
    }

    switch (args) {
      case SettingsRoute():
        return MaterialPageRoute(builder: (_) => const AppSettingPage());
      case QrCreateRoute():
        return MaterialPageRoute(builder: (_) => QrCreatePage());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            body: Center(child: Text(Languages.translate.pageNotFound)),
          ),
    );
  }
}
