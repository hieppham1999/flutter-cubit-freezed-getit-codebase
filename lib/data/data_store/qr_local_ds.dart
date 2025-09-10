import 'package:flutter_cubit_freezed_getit_codebase/data/dao/qr_dao.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/entity/qr_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class QrLocalDataSource {
  final QrDao dao;

  QrLocalDataSource(this.dao);

  Future<void> insert(QrEntity entity) => dao.insert(entity);

  Future<List<QrEntity>> getAll() => dao.getAll();

  Future<void> delete(String id) => dao.delete(id);

  Future<void> update(QrEntity entity) => dao.update(entity);

  Future<QrEntity?> getById(String id) => dao.getById(id);
}