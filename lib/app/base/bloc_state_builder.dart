import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_logger.dart';
import 'app_state.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_error_view.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_loading_view.dart';

typedef ChildStateBuilder<T> = Widget Function(BuildContext context, T state);

/// A BlocConsumer wrapper that renders the right widget for each
/// [CubitState] branch with sensible defaults.
class CubitStateBuilder<T> extends StatelessWidget {
  const CubitStateBuilder({
    super.key,
    required this.builder,
    required this.cubit,
    this.loadingBuilder,
    this.errorBuilder,
    this.onRetry,
  });

  /// Typed on `T`, not the raw `Cubit<CubitState>`: a raw bound lets a
  /// `CubitStateBuilder<Foo>` accept a cubit emitting some other state type,
  /// and the mismatch only surfaces at runtime inside [builder].
  final Cubit<CubitState<T>> cubit;
  final ChildStateBuilder<T> builder;
  final ChildStateBuilder<T>? loadingBuilder;
  final ChildStateBuilder<T>? errorBuilder;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubit<CubitState<T>>, CubitState<T>>(
      bloc: cubit,
      listener: (context, state) {
        appLogger.d('${cubit.runtimeType}: New state -> $state');
      },
      builder: (context, state) {
        switch (state) {
          case NormalState():
            return builder(context, state.data);
          case LoadingState():
            return loadingBuilder?.call(context, state.data) ??
                const AppLoadingView();
          case ErrorState():
            return errorBuilder?.call(context, state.data) ??
                AppErrorView(message: state.error.message, onRetry: onRetry);
        }
      },
    );
  }
}
