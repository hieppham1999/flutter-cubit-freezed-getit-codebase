import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_entity.freezed.dart';
part 'qr_entity.g.dart';

@freezed
abstract class QrEntity with _$QrEntity {
  const factory QrEntity({
    required String id,
    required String rawJsonData,
    required DateTime createdAt,
    required DateTime updatedAt,

  }) = _QrEntity;

  /// Factory method for deserialization from JSON
  factory QrEntity.fromJson(Map<String, dynamic> json) => _$QrEntityFromJson(json);
}