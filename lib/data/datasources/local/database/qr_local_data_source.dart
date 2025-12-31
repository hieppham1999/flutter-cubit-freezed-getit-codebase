import 'package:flutter_cubit_freezed_getit_codebase/data/datasources/local/database/daos/qr_dao.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class QrLocalDataSource {
  final QrDao dao;

  QrLocalDataSource(this.dao);

  Future<void> insert(QrModel entity) => dao.insert(entity);

  Future<List<QrModel>> getAll() => dao.getAll();

  Future<void> delete(String id) => dao.delete(id);

  Future<void> update(QrModel entity) => dao.update(entity);

  Future<QrModel?> getById(String id) => dao.getById(id);
}