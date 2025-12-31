// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../qr_eye_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrEyeStyle _$QrEyeStyleFromJson(Map<String, dynamic> json) => _QrEyeStyle(
  shape: $enumDecodeNullable(_$EyeTypeEnumMap, json['shape']) ?? EyeType.square,
  color: (json['color'] as num?)?.toInt() ?? _defaultEyeColor,
);

Map<String, dynamic> _$QrEyeStyleToJson(_QrEyeStyle instance) =>
    <String, dynamic>{
      'shape': _$EyeTypeEnumMap[instance.shape]!,
      'color': instance.color,
    };

const _$EyeTypeEnumMap = {EyeType.square: 'square', EyeType.circle: 'circle'};
