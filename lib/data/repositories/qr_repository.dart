import 'package:flutter_cubit_freezed_getit_codebase/data/datasources/local/database/qr_local_data_source.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/repositories/qr_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QrRepository)
class QrRepositoryImpl implements QrRepository {
  final QrLocalDataSource localDataSource;

  QrRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveQr(QrModel qrModel) async {
    await localDataSource.insert(qrModel);
  }
}