import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/base/app_state.dart';

class BaseCubit<T> extends Cubit<CubitState<T>> {
  BaseCubit.normal(T initialState) : super(CubitState.normal(initialState));

  BaseCubit.loading(T initialState) : super(CubitState.loading(initialState));

  BaseCubit.error(String message, T initialState)
      : super(CubitState.error(message: message, data: initialState));

  void emitNormal([T? data]) {
    emit(CubitState.normal(data ?? state.data));
  }

  void emitLoading() {
    emit(CubitState.loading(state.data));
  }

  void emitError(String message) {
    emit(CubitState.error(message: message, data: state.data));
  }

  T get currentData => state.data;
}