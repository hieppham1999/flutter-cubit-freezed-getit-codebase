import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/qr_module_style.freezed.dart';
part 'generated/qr_module_style.g.dart';

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
