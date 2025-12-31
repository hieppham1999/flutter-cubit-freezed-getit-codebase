// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../qr_decoration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrDecoration _$QrDecorationFromJson(Map<String, dynamic> json) =>
    _QrDecoration(
      eyeStyle:
          json['eyeStyle'] == null
              ? const QrEyeStyle()
              : QrEyeStyle.fromJson(json['eyeStyle'] as Map<String, dynamic>),
      moduleStyle:
          json['moduleStyle'] == null
              ? const QrModuleStyle()
              : QrModuleStyle.fromJson(
                json['moduleStyle'] as Map<String, dynamic>,
              ),
      backgroundColor: (json['backgroundColor'] as num?)?.toInt() ?? 0xFFFFFFFF,
    );

Map<String, dynamic> _$QrDecorationToJson(_QrDecoration instance) =>
    <String, dynamic>{
      'eyeStyle': instance.eyeStyle,
      'moduleStyle': instance.moduleStyle,
      'backgroundColor': instance.backgroundColor,
    };
