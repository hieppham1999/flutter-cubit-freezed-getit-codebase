// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrModel _$QrModelFromJson(Map<String, dynamic> json) => _QrModel(
  id: json['id'] as String,
  content: json['content'] as String?,
  originalContent: json['originalContent'] as String?,
  decoration:
      json['decoration'] == null
          ? const QrDecoration()
          : QrDecoration.fromJson(json['decoration'] as Map<String, dynamic>),
  version: (json['version'] as num?)?.toInt() ?? -1,
  type: $enumDecodeNullable(_$QrTypeEnumMap, json['type']) ?? QrType.create,
);

Map<String, dynamic> _$QrModelToJson(_QrModel instance) => <String, dynamic>{
  'id': instance.id,
  'content': instance.content,
  'originalContent': instance.originalContent,
  'decoration': instance.decoration,
  'version': instance.version,
  'type': _$QrTypeEnumMap[instance.type]!,
};

const _$QrTypeEnumMap = {QrType.create: 'create', QrType.clone: 'clone'};
