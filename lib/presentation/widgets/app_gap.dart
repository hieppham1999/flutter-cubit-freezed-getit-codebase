import 'package:flutter/widgets.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/dimensions.dart';

/// Empty box used as spacing between flex children.
/// Prefer over inline `SizedBox(height: 8)` for consistent rhythm.
class AppGap extends StatelessWidget {
  const AppGap(this.size, {super.key, this.horizontal = false});

  const AppGap.tiny({super.key, this.horizontal = false})
    : size = AppSpacing.tiny;
  const AppGap.small({super.key, this.horizontal = false})
    : size = AppSpacing.small;
  const AppGap.medium({super.key, this.horizontal = false})
    : size = AppSpacing.medium;
  const AppGap.large({super.key, this.horizontal = false})
    : size = AppSpacing.large;
  const AppGap.extraLarge({super.key, this.horizontal = false})
    : size = AppSpacing.extraLarge;

  final double size;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontal ? size : 0,
      height: horizontal ? 0 : size,
    );
  }
}
