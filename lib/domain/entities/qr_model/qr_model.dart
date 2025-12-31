import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_decoration.dart';

abstract interface class QrCode {
  String get id;
  String? get content;
  String? get originalContent;
  QrDecoration get decoration;
  int get version;
  QrType get type;
}






