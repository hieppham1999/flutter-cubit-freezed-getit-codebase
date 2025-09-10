import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'qr_model.freezed.dart';
part 'qr_model.g.dart';

const MyQrModuleStyle _defaultModuleStyle = _MyQrModuleStyle();

const MyQrEyeStyle _defaultEyeStyle = MyQrEyeStyle();

enum QrType {
  create,
  clone
}

@unfreezed
abstract class QrModel with _$QrModel {
  const QrModel._();

  factory QrModel({
    String? content,
    String? originalContent,
    @Default(_defaultEyeStyle) MyQrEyeStyle eyeStyle,
    @Default(_defaultModuleStyle) MyQrModuleStyle moduleStyle,
    @ColorConverter() @Default(Colors.blueAccent) Color backgroundColor,
    @Default(-1) int version,
    @Default(QrType.create) QrType type,
  }) = _QrModel;

  factory QrModel.df() => _QrModel();

  factory QrModel.clone(String? content) =>
      _QrModel(content: content, originalContent: content, type: QrType.clone,);

  factory QrModel.copyWithStyle(QrModel model, QrModel styleFrom) =>
      styleFrom.copyWith(content: model.content);

  factory QrModel.defaultStyle(QrModel model) => QrModel(content: model.content);

  factory QrModel.fromJson(Map<String, dynamic> json) => _$QrModelFromJson(json);
}

enum ModuleType {
  square,
  circle;

  QrDataModuleShape toLibType() {
    switch (this) {
      case ModuleType.square:
        return QrDataModuleShape.square;
      case ModuleType.circle:
        return QrDataModuleShape.circle;
    }
  }

  String get displayName {
    switch (this) {
      case ModuleType.square:
        return 'Square';
      case ModuleType.circle:
        return 'Circle';
    }
  }
}


enum EyeType {
  square,
  circle;

  QrEyeShape toLibType() {
    switch (this) {
      case EyeType.square:
        return QrEyeShape.square;
      case EyeType.circle:
        return QrEyeShape.circle;
    }
  }

  String get displayName {
    switch (this) {
      case EyeType.square:
        return 'Square';
      case EyeType.circle:
        return 'Circle';
    }
  }
}

const _defaultEyeColor = Colors.white;

@freezed
abstract class MyQrEyeStyle with _$MyQrEyeStyle {

  const MyQrEyeStyle._();

  const factory MyQrEyeStyle({
    @Default(EyeType.square) EyeType shape,
    @ColorConverter() @Default(_defaultEyeColor) Color color,
  }) = _MyQrEyeStyle;

  factory MyQrEyeStyle.fromLib(QrEyeStyle libStyle) {
    return MyQrEyeStyle(
      shape: libStyle.eyeShape == QrEyeShape.circle ? EyeType.circle : EyeType.square,
      color: libStyle.color ?? _defaultEyeColor,
    );
  }

  QrEyeStyle toLib() => QrEyeStyle(
    eyeShape: shape == EyeType.circle ? QrEyeShape.circle : QrEyeShape.square,
    color: color,
  );

  factory MyQrEyeStyle.fromJson(Map<String, dynamic> json) => _$MyQrEyeStyleFromJson(json);
}

const _defaultModuleColor = Colors.white;

@freezed
abstract class MyQrModuleStyle with _$MyQrModuleStyle {

  const MyQrModuleStyle._();

  const factory MyQrModuleStyle({
    @Default(ModuleType.square) ModuleType shape,
    @ColorConverter() @Default(_defaultModuleColor) Color color,
  }) = _MyQrModuleStyle;

  factory MyQrModuleStyle.fromLib(QrDataModuleStyle libStyle) {
    return MyQrModuleStyle(
      shape: libStyle.dataModuleShape == QrDataModuleShape.circle
          ? ModuleType.circle
          : ModuleType.square,
      color: libStyle.color ?? _defaultModuleColor,
    );
  }

  QrDataModuleStyle toLib() => QrDataModuleStyle(
    dataModuleShape:
    shape == ModuleType.circle ? QrDataModuleShape.circle : QrDataModuleShape.square,
    color: color,
  );

  factory MyQrModuleStyle.fromJson(Map<String, dynamic> json) => _$MyQrModuleStyleFromJson(json);
}

class ColorConverter extends JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) {
    return Color(json);
  }

  @override
  int toJson(Color object) {
    return object.toARGB32();
  }

}