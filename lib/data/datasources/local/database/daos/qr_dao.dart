import 'package:flutter_cubit_freezed_getit_codebase/core/constants/constants.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/datasources/local/database/qr_database.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/entity/qr_entity.dart';
import 'package:flutter_cubit_freezed_getit_codebase/data/models/qr_model.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class QrDao {
  final QrDatabase db;

  QrDao(this.db);

  Future<void> insert(QrCode entity) async {
    await db.instance.insert(
      Constants.qrModelTabelName,
      entity.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(QrModel entity) async {
    await db.instance.update(
      Constants.qrModelTabelName,
      entity.toJson(),
      where: "id = ?",
      whereArgs: [entity.id],
    );
  }

  Future<List<QrModel>> getAll() async {
    final maps = await db.instance.query(Constants.qrModelTabelName);
    return maps.map((e) => QrModel.fromJson(e)).toList();
  }

  Future<void> delete(String id) async {
    await db.instance.delete(Constants.qrModelTabelName, where: 'id = ?', whereArgs: [id]);
  }

  Future<QrModel?> getById(String id) async {
    final result = await db.instance.query(
      Constants.qrModelTabelName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return QrModel.fromJson(result.first);
    }
    return null;
  }
}