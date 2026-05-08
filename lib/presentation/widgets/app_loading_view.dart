import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key, this.size = 40, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? Theme.of(context).colorScheme.primary;
    return Center(
      child: SpinKitRing(
        size: size,
        color: indicatorColor,
        lineWidth: 3,
      ),
    );
  }
}

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.4),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLoadingView(),
            if (message != null) ...[
              const SizedBox(height: AppSpacing.medium),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
