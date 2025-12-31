import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';

abstract class QrRepository {
  Future<void> saveQr(QrModel qrModel);
}
