import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_decoration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/qr_decoration_model.freezed.dart';
part 'generated/qr_decoration_model.g.dart';

@freezed
abstract class QrDecorationModel with _$QrDecorationModel implements QrDecoration {
  const QrDecorationModel._();

  factory QrDecorationModel({
    @Default(QrEyeStyle()) eyeStyle,
    @Default(QrModuleStyle()) moduleStyle,
    @Default(0xFFFFFFFF) int backgroundColor,
  }) = _QrDecorationModel;

  factory QrDecorationModel.fromJson(Map<String, dynamic> json) =>
      _$QrDecorationModelFromJson(json);
}
