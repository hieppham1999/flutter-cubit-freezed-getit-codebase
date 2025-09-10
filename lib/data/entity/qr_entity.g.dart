// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrEntity _$QrEntityFromJson(Map<String, dynamic> json) => _QrEntity(
  id: json['id'] as String,
  rawJsonData: json['rawJsonData'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$QrEntityToJson(_QrEntity instance) => <String, dynamic>{
  'id': instance.id,
  'rawJsonData': instance.rawJsonData,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
