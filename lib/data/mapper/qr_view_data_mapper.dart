import 'dart:convert';

import 'package:flutter_cubit_freezed_getit_codebase/data/entity/qr_entity.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/mapper/mapper.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/model/qr_model/qr_model.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/viewmodels/qr_view_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class QrViewDataMapper
    implements Mapper<QrEntity, QrViewData> {
  QrViewDataMapper();

  @override
  QrEntity mapToEntity(QrViewData model) {
    return QrEntity(
      id: model.id,
      rawJsonData: jsonEncode(model.model.toJson()),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  @override
  QrViewData mapToModel(QrEntity entity) {
    return QrViewData(
      id: entity.id,
      model: QrModel.fromJson(jsonDecode(entity.rawJsonData)),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
