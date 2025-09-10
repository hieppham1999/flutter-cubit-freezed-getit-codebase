import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_freezed_getit_codebase/base/app_state.dart';
import 'package:flutter_cubit_freezed_getit_codebase/utils/app_logger.dart';


typedef ChildStateBuilder<T> = Widget Function(BuildContext context, T state);

/// A BlocConsumer wrapper
class CubitStateBuilder<T> extends StatefulWidget {
  const CubitStateBuilder({
    super.key,
    required this.builder,
    required this.cubit,
    this.loadingBuilder,
    this.errorBuilder,
  });

  final Cubit<CubitState> cubit;
  final ChildStateBuilder<T> builder;
  final ChildStateBuilder<T>? loadingBuilder;
  final ChildStateBuilder<T>? errorBuilder;

  @override
  State<CubitStateBuilder<T>> createState() => _CubitStateBuilderState<T>();
}

class _CubitStateBuilderState<T> extends State<CubitStateBuilder<T>> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubit<CubitState>, CubitState>(
      bloc: widget.cubit,
      listener: (context, state) {
        appLogger.d(
          "${widget.cubit.runtimeType}: New state -> ${state.toString()}",
        );
      },
      builder: (context, state) {
        switch (state) {
          case NormalState():
            return widget.builder.call(context, state.data);
          case LoadingState():
            return widget.loadingBuilder?.call(context, state.data) ?? Center(child: CircularProgressIndicator(),);
          case ErrorState():
            return widget.errorBuilder?.call(context, state.data) ?? Center(child: Text(state.message));
        }
      },
      buildWhen: (oldState, newState) {
        switch (newState) {
          case NormalState():
            return true;
          case LoadingState():
            return true;
          case ErrorState():
            return true;
        }
      },
    );
  }
}
