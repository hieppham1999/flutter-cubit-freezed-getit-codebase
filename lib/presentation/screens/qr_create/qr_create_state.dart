import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/qr_create_state.freezed.dart';

@freezed
abstract class QrCreateState with _$QrCreateState {
  factory QrCreateState({String? id, required QrModel qrModel}) = _QrCreateState;

  factory QrCreateState.df() => _QrCreateState(qrModel: QrModel.df());
}
