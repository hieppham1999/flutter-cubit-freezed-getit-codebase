/// Spacing, radius, and size constants used across the app to keep visual
/// rhythm consistent. Prefer these over inline magic numbers.
class AppSpacing {
  AppSpacing._();

  static const double tiny = 4;
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 24;
  static const double huge = 32;
}

class AppRadius {
  AppRadius._();

  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 24;
  static const double pill = 999;
}

class AppSizes {
  AppSizes._();

  static const double buttonHeight = 56;
  static const double fieldHeight = 48;
  static const double dropdownHeight = 40;
  static const double iconSmall = 16;
  static const double iconMedium = 24;
  static const double iconLarge = 32;
}

class AppDuration {
  AppDuration._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}
