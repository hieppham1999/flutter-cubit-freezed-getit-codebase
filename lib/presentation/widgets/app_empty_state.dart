import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/dimensions.dart';

/// Icon → title → explanation → action, centred in the content area.
///
/// Also the layout `AppErrorView` renders through: empty and error are the same
/// shape with different content, and keeping two hand-built copies is how two
/// screens that mean the same thing slowly drift apart.
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    this.icon = Icons.inbox_outlined,
    this.iconColor,
    this.title,
    this.subtitle,
    this.action,
  });

  final IconData icon;

  /// Defaults to a muted `onSurface`. `AppErrorView` passes `colorScheme.error`.
  final Color? iconColor;
  final String? title;
  final String? subtitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.extraLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 64,
              color:
                  iconColor ??
                  theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            const SizedBox(height: AppSpacing.medium),
            Text(
              title ?? Languages.translate.commonNoData,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.small),
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: AppSpacing.large),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
