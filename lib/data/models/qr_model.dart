import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/models/qr_decoration_model.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/qr_model.freezed.dart';
part 'generated/qr_model.g.dart';

@freezed
abstract class QrModel with _$QrModel implements QrCode {
  const QrModel._();

  factory QrModel({
    required String id,
    String? content,
    String? originalContent,
    QrDecorationModel?  decoration,
    @Default(-1) int version,
    @Default(QrType.create) QrType type,
  }) = _QrModel;

  factory QrModel.df() => QrModel(id: Uuid().v4());

  factory QrModel.clone(String? content) => QrModel(
    id: Uuid().v4(),
    content: content,
    originalContent: content,
    type: QrType.clone,
  );

  factory QrModel.copyWithStyle(QrCode model, QrCode styleFrom) {
    final decoration = styleFrom.decoration;
    final decorationModel =
        decoration is QrDecorationModel
            ? decoration
            : QrDecorationModel(
              eyeStyle: decoration.eyeStyle,
              moduleStyle: decoration.moduleStyle,
              backgroundColor: decoration.backgroundColor,
            );
    return QrModel(
      id: model.id,
      content: model.content,
      originalContent: styleFrom.originalContent,
      decoration: decorationModel,
      version: styleFrom.version,
      type: styleFrom.type,
    );
  }

  factory QrModel.defaultStyle(QrCode model) => QrModel(id: model.id, content: model.content);

  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);
}
