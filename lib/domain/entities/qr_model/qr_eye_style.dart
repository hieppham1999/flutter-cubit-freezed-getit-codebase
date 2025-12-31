import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/qr_eye_style.freezed.dart';
part 'generated/qr_eye_style.g.dart';



const _defaultEyeColor = 0xFFFFFFFF;

@freezed
abstract class QrEyeStyle with _$QrEyeStyle {

  const QrEyeStyle._();

  const factory QrEyeStyle({
    @Default(EyeType.square) EyeType shape,
    @Default(_defaultEyeColor) int color,
  }) = _QrEyeStyle;

  factory QrEyeStyle.fromJson(Map<String, dynamic> json) => _$QrEyeStyleFromJson(json);
}
