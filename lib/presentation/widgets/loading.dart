import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double _kDefaultLoadingIndicatorSize = 50;
const Color _kLoadingBackground = Color(0xA6000000);
const Color _kLoadingProgress = Color(0xA63AFF19);
const Color _kLoadingMask = Color(0x80000000);

/// Counter-based loading overlay so concurrent `show`/`dismiss` calls from
/// independent cubits don't desync the visible state. The overlay stays up
/// while at least one caller is still "showing" and only dismisses once the
/// last caller dismisses.
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

  static Future<void> show({String? status, int? timeOut}) async {
    _scheduleSafetyDismiss(seconds: timeOut ?? 30);
    _loadingCount++;
    if (_loadingCount > 1) return;

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

  static Future<void> showSuccess(String text, {int duration = 500}) =>
      EasyLoading.showSuccess(text, duration: Duration(milliseconds: duration));

  static Future<void> showError(String text, {int duration = 500}) =>
      EasyLoading.showError(text, duration: Duration(milliseconds: duration));

  static Future<void> showInfo(String text, {int duration = 500}) =>
      EasyLoading.showInfo(text, duration: Duration(milliseconds: duration));

  static void _scheduleSafetyDismiss({required int seconds}) {
    _safetyTimer?.cancel();
    _safetyTimer = Timer(Duration(seconds: seconds), reset);
  }
}
