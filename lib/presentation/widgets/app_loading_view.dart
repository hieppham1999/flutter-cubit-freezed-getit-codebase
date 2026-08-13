import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Spinner **inside the content area** — the `CubitStateBuilder` default.
///
/// The blocking full-screen overlay is not built here, it is `LoadingUtil.show()`:
/// that one reference-counts its callers (two cubits waiting → one overlay) and
/// carries a safety timer that closes an overlay whose caller forgot to
/// `dismiss()`. An `AppLoadingOverlay` widget used to sit in this file doing the
/// same job with neither of those, and with no call sites — it was removed.
class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key, this.size = 40, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? Theme.of(context).colorScheme.primary;
    return Center(
      child: SpinKitRing(size: size, color: indicatorColor, lineWidth: 3),
    );
  }
}
