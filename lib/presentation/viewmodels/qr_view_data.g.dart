// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_view_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrViewData _$QrViewDataFromJson(Map<String, dynamic> json) => _QrViewData(
  id: json['id'] as String,
  model: QrModel.fromJson(json['model'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$QrViewDataToJson(_QrViewData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
