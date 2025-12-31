// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../qr_module_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrModuleStyle _$QrModuleStyleFromJson(Map<String, dynamic> json) =>
    _QrModuleStyle(
      shape:
          $enumDecodeNullable(_$ModuleTypeEnumMap, json['shape']) ??
          ModuleType.square,
      color: (json['color'] as num?)?.toInt() ?? _defaultModuleColor,
    );

Map<String, dynamic> _$QrModuleStyleToJson(_QrModuleStyle instance) =>
    <String, dynamic>{
      'shape': _$ModuleTypeEnumMap[instance.shape]!,
      'color': instance.color,
    };

const _$ModuleTypeEnumMap = {
  ModuleType.square: 'square',
  ModuleType.circle: 'circle',
};
