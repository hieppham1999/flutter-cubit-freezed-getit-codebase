import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/generated/l10n/app_localizations.dart';

/// The single gate widgets use to read theme / colours / text styles — do not
/// scatter `Theme.of(context)` calls through widget code, go through the getters
/// here.
///
/// Navigation deliberately does **not** live here: use `NavController`
/// (`core/navigation/app_navigator.dart`). Two owners for the same back stack is
/// how navigation bugs start, and a route pushed straight through
/// `Navigator.of(context)` bypasses `AppRouter` entirely — leaving it with no
/// `settings.name`, which is what makes `popUntil` clear the whole stack.
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? Languages.translate;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  void hideKeyboard() => FocusScope.of(this).unfocus();
}
