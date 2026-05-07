import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/base/app_logger.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/base/app_state.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/base/state_diff_logger.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/exceptions/app_exception.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/loading.dart';

class BaseCubit<T> extends Cubit<CubitState<T>> {
  BaseCubit.normal(T initialState) : super(CubitState.normal(initialState));

  BaseCubit.loading(T initialState) : super(CubitState.loading(initialState));

  BaseCubit.error(AppException error, T initialState)
    : super(CubitState.error(error: error, data: initialState));

  void emitNormal([T? data]) {
    emit(CubitState.normal(data ?? state.data));
  }

  void emitLoading() {
    emit(CubitState.loading(state.data));
  }

  void emitError(AppException error) {
    emit(CubitState.error(error: error, data: state.data));
  }

  /// Convenience for cases where you only have a string message.
  void emitErrorMessage(String message, {String? code}) {
    emitError(UnknownException(message: message, code: code));
  }

  T get currentData => state.data;

  Future<void> makeAnAction(
    Future<void> Function() action, {
    bool showLoading = true,
    bool emitErrorOnFailure = true,
    void Function(AppException error)? onError,
  }) async {
    if (showLoading) {
      LoadingUtil.show();
    }
    try {
      await action();
    } catch (e, stackTrace) {
      final appError = AppException.from(e, stackTrace);
      appLogger.e(appError.message, e, stackTrace);
      if (onError != null) {
        onError(appError);
      } else if (emitErrorOnFailure) {
        emitError(appError);
      }
    } finally {
      if (showLoading) {
        LoadingUtil.dismiss();
      }
    }
  }

  @override
  void onChange(Change<CubitState<T>> change) {
    super.onChange(change);
    final diffMessage = StateDiffLogger.buildDiff(
      change.currentState,
      change.nextState,
    );
    if (diffMessage != null) {
      appLogger.d('${state.runtimeType} in $runtimeType: $diffMessage');
    }
  }
}
