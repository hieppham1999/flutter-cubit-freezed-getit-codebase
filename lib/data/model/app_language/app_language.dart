import 'dart:ui';

import 'package:flutter_cubit_freezed_getit_codebase/core/languages.dart';

enum AppLanguage {
  en(Locale('en')),
  vi(Locale('vi'));

  const AppLanguage(this.locale);

  final Locale locale;

  String get displayName => switch(this) {
    AppLanguage.en => Languages.translate.english,
    AppLanguage.vi => Languages.translate.vietnamese,
  };

  String get displayNativeName => switch(this) {
    AppLanguage.en => Languages.translate.english_native,
    AppLanguage.vi => Languages.translate.vietnamese_native,
  };
}