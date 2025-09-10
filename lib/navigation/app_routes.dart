import 'package:flutter_cubit_freezed_getit_codebase/data/model/qr_model/qr_model.dart';

sealed class AppRoutes {
  final String path;
  const AppRoutes({required this.path});
}

class SettingsRoute extends AppRoutes {
  const SettingsRoute() : super(path: '/settings');
}

class QrCreateRoute extends AppRoutes {
  final String? id;
  final QrModel? qrModel;

  const QrCreateRoute({this.id, this.qrModel,})
      : super(path: '/qr-create');
}
