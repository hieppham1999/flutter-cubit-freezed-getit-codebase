import 'dart:convert';

import 'package:flutter_cubit_freezed_getit_codebase/data/data_store/qr_local_ds.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/entity/qr_entity.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/model/qr_model/qr_model.dart';
import 'package:injectable/injectable.dart';

abstract class QrRepository {
  Future<void> saveQr(QrModel qrModel);
}

@Injectable(as: QrRepository)
class QrRepositoryImpl implements QrRepository {
  final QrLocalDataSource localDataSource;

  QrRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveQr(QrModel qrModel) async {
    final entity = QrEntity(
      id: '1',
      rawJsonData: jsonEncode(qrModel.toJson()),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await localDataSource.insert(entity);
  }
}