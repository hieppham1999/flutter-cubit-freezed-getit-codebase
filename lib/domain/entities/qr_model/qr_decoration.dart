import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_eye_style.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_module_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/qr_decoration.freezed.dart';
part 'generated/qr_decoration.g.dart';

@freezed
abstract class QrDecoration with _$QrDecoration {
  const QrDecoration._();

  const factory QrDecoration({
    @Default(const QrEyeStyle()) QrEyeStyle eyeStyle,
    @Default(const QrModuleStyle()) QrModuleStyle moduleStyle,
    @Default(0xFFFFFFFF) int backgroundColor,
  }) = _QrDecoration;

  factory QrDecoration.fromJson(Map<String, dynamic> json) =>
      _$QrDecorationFromJson(json);
}
