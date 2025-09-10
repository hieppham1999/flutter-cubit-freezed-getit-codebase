import 'package:flutter_cubit_freezed_getit_codebase/data/database/qr_database.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/entity/qr_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class QrDao {
  final QrDatabase db;

  QrDao(this.db);

  static const tableName = 'qr_table';

  static const createTable = '''
    CREATE TABLE $tableName (
      id TEXT PRIMARY KEY,
      rawJsonData TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )
  ''';

  Future<void> insert(QrEntity entity) async {
    await db.instance.insert(
      tableName,
      entity.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(QrEntity entity) async {
    await db.instance.update(
      tableName,
      entity.toJson(),
      where: "id = ?",
      whereArgs: [entity.id],
    );
  }

  Future<List<QrEntity>> getAll() async {
    final maps = await db.instance.query(tableName);
    return maps.map((e) => QrEntity.fromJson(e)).toList();
  }

  Future<void> delete(String id) async {
    await db.instance.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<QrEntity?> getById(String id) async {
    final result = await db.instance.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return QrEntity.fromJson(result.first);
    }
    return null;
  }
}