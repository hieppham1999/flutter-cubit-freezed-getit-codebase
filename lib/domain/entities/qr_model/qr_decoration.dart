import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/qr_decoration.freezed.dart';
part 'generated/qr_decoration.g.dart';

const QrModuleStyle defaultModuleStyle = QrModuleStyle();

const QrEyeStyle defaultEyeStyle = QrEyeStyle();

const _defaultEyeColor = 0xFFFFFFFF;

abstract interface class QrDecoration {
  QrEyeStyle get eyeStyle;
  QrModuleStyle get moduleStyle;
  int get backgroundColor;
}

@freezed
abstract class QrEyeStyle with _$QrEyeStyle {

  const QrEyeStyle._();

  const factory QrEyeStyle({
    @Default(EyeType.square) EyeType shape,
    @Default(_defaultEyeColor) int color,
  }) = _QrEyeStyle;

  factory QrEyeStyle.fromJson(Map<String, dynamic> json) => _$QrEyeStyleFromJson(json);
}

const _defaultModuleColor = 0xFFFFFFFF;

@freezed
abstract class QrModuleStyle with _$QrModuleStyle {

  const QrModuleStyle._();

  const factory QrModuleStyle({
    @Default(ModuleType.square) ModuleType shape,
    @Default(_defaultModuleColor) int color,
  }) = _QrModuleStyle;

  factory QrModuleStyle.fromJson(Map<String, dynamic> json) => _$QrModuleStyleFromJson(json);
}


