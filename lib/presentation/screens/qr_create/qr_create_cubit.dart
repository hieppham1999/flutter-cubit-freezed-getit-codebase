import 'package:flutter_cubit_freezed_getit_codebase/domain/repositories/qr_repository.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/base/base_cubit.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/screens/qr_create/qr_create_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class QrCreateCubit extends BaseCubit<QrCreateState> {
  QrCreateCubit(this._repository) : super.normal(QrCreateState.df());

  final QrRepository _repository;

  void updateQrModel(QrModel model) {
    emitNormal(currentData.copyWith(qrModel: model));
  }

  void updateQrData(String data) {
    if (data.isNotEmpty) {
      emitNormal(currentData.copyWith(qrModel: currentData.qrModel.copyWith(content: data)));
    } else {
      emitError("Not a valid text");
    }
  }

  void updateQrStyle(QrModel model) {
    emitNormal(
      currentData.copyWith(
          qrModel: QrModel.copyWithStyle(currentData.qrModel, model)),
    );
  }

  void resetQrStyle() {
    emitNormal(
      currentData.copyWith(qrModel: QrModel.defaultStyle(currentData.qrModel)),
    );
  }
}
