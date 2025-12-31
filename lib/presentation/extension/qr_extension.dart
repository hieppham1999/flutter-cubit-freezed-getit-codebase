import 'dart:ui';

import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_eye_style.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_module_style.dart';
import 'package:qr_flutter/qr_flutter.dart' as qr;

extension QrEyeStyleExtension on QrEyeStyle {
  qr.QrEyeStyle toLib() {
    return qr.QrEyeStyle(
      eyeShape: shape == EyeType.circle ? qr.QrEyeShape.circle : qr.QrEyeShape.square,
      color: Color(color),
    );
  }
}

extension QrModuleStyleExtension on QrModuleStyle {
  qr.QrDataModuleStyle toLib() {
    return qr.QrDataModuleStyle(
      dataModuleShape: shape == ModuleType.circle
          ? qr.QrDataModuleShape.circle
          : qr.QrDataModuleShape.square,
      color: Color(color),
    );
  }
}
