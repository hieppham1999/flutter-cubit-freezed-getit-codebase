import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double _kDefaultLoadingIndicatorSize = 50;
const Color _kLoadingBackground = Color(0xA6000000);
const Color _kLoadingProgress = Color(0xA63AFF19);
const Color _kLoadingMask = Color(0x80000000);

const Duration _kToastDuration = Duration(milliseconds: 500);
const Duration _kLoadingSafetyTimeout = Duration(seconds: 30);

/// Counter-based loading overlay so concurrent `show`/`dismiss` calls from
/// independent cubits don't desync the visible state. The overlay stays up
/// while at least one caller is still "showing" and only dismisses once the
/// last caller dismisses.
///
/// **This is also the only route for transient toasts** ([showSuccess] /
/// [showError] / [showInfo]) — do not add a second notification mechanism next
/// to it, or which one a user sees ends up depending on which screen they are
/// on.
///
/// `EasyLoading` mounts its own overlay, so a toast needs **no `BuildContext`**.
/// A cubit can raise one directly instead of borrowing
/// `NavigatorKey.key.currentContext` — which is exactly the context that dies
/// the moment navigation tears the stack down.
class LoadingUtil {
  static int _loadingCount = 0;
  static Timer? _safetyTimer;

  static void setup() {
    EasyLoading.instance
      ..backgroundColor = _kLoadingBackground
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorColor = _kLoadingProgress
      ..progressColor = _kLoadingProgress
      ..textColor = _kLoadingProgress
      ..dismissOnTap = false
      ..boxShadow = [] // keep this to make backgroundColor take effect
      ..userInteractions = false
      ..maskColor = _kLoadingMask
      ..loadingStyle = EasyLoadingStyle.custom;
  }

  static Future<void> show({String? status, Duration? timeOut}) async {
    _scheduleSafetyDismiss(timeOut ?? _kLoadingSafetyTimeout);
    _loadingCount++;
    if (_loadingCount > 1) return;
    // The counter keeps running even with no overlay attached, so `show` and
    // `dismiss` stay balanced when a cubit spins up a loader outside the app —
    // see [_mounted].
    if (!_mounted) return;

    await EasyLoading.show(
      status: status,
      dismissOnTap: false,
      indicator: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: _kDefaultLoadingIndicatorSize),
        child: SpinKitRing(
          size: _kDefaultLoadingIndicatorSize,
          color: _kLoadingProgress,
          lineWidth: 3,
        ),
      ),
    );
  }

  static Future<void> dismiss() async {
    if (_loadingCount > 0) _loadingCount--;
    if (_loadingCount > 0) return;
    _safetyTimer?.cancel();
    await EasyLoading.dismiss();
  }

  /// Forces the overlay to close regardless of pending callers. Use only when
  /// you know the counter is out of sync (e.g. after a hot reload).
  static Future<void> reset() async {
    _loadingCount = 0;
    _safetyTimer?.cancel();
    await EasyLoading.dismiss();
  }

  /// Whether `EasyLoading.init()` has attached its overlay (`app.dart` wires it
  /// through `MaterialApp.builder`).
  ///
  /// Not attached means we are running outside the app — a cubit test is a plain
  /// `test()` with no `MaterialApp` anywhere. `EasyLoading` **asserts** in that
  /// case, and a decorative toast must never throw back into its caller: a cubit
  /// that reports success inside a `try` block would have that assert caught by
  /// the surrounding `catch` and turn a successful operation into an error
  /// message for the user.
  static bool get _mounted => EasyLoading.instance.overlayEntry != null;

  static Future<void> showSuccess(
    String text, {
    Duration duration = _kToastDuration,
  }) async {
    if (!_mounted) return;
    await EasyLoading.showSuccess(text, duration: duration);
  }

  static Future<void> showError(
    String text, {
    Duration duration = _kToastDuration,
  }) async {
    if (!_mounted) return;
    await EasyLoading.showError(text, duration: duration);
  }

  static Future<void> showInfo(
    String text, {
    Duration duration = _kToastDuration,
  }) async {
    if (!_mounted) return;
    await EasyLoading.showInfo(text, duration: duration);
  }

  static void _scheduleSafetyDismiss(Duration timeout) {
    _safetyTimer?.cancel();
    _safetyTimer = Timer(timeout, reset);
  }
}
