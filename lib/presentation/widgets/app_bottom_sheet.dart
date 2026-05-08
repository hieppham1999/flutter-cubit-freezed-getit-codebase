import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool handleKeyboardInsets;
  final EdgeInsetsGeometry? padding;

  const AppBottomSheet({
    super.key,
    required this.title,
    required this.child,
    this.actionLabel,
    this.onAction,
    this.handleKeyboardInsets = false,
    this.padding,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget child,
    String? actionLabel,
    VoidCallback? onAction,
    bool handleKeyboardInsets = false,
    EdgeInsetsGeometry? padding,
    bool showDragHandle = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => AppBottomSheet(
        title: title,
        actionLabel: actionLabel,
        onAction: onAction,
        handleKeyboardInsets: handleKeyboardInsets,
        padding: padding,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final defaultPadding = EdgeInsets.only(
      left: 24,
      right: 24,
      top: 16,
      bottom: handleKeyboardInsets
          ? MediaQuery.of(context).viewInsets.bottom + 16
          : 16,
    );

    return SafeArea(
      child: Padding(
        padding: padding ?? defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            // Content
            Flexible(child: child),
            // Action button
            if (onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: colorScheme.primary,
                  minimumSize: const Size.fromHeight(56),
                ),
                child: Text(
                  actionLabel ?? Languages.translate.save,
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
