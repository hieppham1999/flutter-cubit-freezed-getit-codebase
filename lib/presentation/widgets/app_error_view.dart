import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_empty_state.dart';

/// Error block inside the content area — the `CubitStateBuilder` default for
/// `ErrorState`.
///
/// Built **on top of [AppEmptyState]**: empty and error are the same layout
/// (icon → title → explanation → action), only the content differs.
///
/// The file stays where it is and the public API is unchanged, so existing
/// imports and call sites need no edit.
class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    this.message,
    this.onRetry,
    this.icon = Icons.error_outline,
  });

  final String? message;
  final VoidCallback? onRetry;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: icon,
      iconColor: Theme.of(context).colorScheme.error,
      title: Languages.translate.commonErrorTitle,
      subtitle: message,
      action:
          onRetry == null
              ? null
              : ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(Languages.translate.commonRetry),
              ),
    );
  }
}
