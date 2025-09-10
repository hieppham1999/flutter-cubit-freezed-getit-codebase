import 'dart:ui';

import 'package:flutter/material.dart';

final Duration animateDuration = Duration(milliseconds: 300);

extension PageControllerExtension on PageController {
  void animateToIndex(int index, {Duration? duration, Curve? curve}) {
    animateToPage(index, duration: duration ?? animateDuration, curve: curve ?? Curves.linear);
  }
}

extension ColorGenerate on Color {
  bool get isLightColor{
    final hsl = HSLColor.fromColor(this);
    print(hsl.lightness);
    return hsl.lightness > 0.5;
  }
}
