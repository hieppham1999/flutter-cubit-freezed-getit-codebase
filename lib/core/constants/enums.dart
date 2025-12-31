import 'dart:ui';

import 'package:flutter_cubit_freezed_getit_codebase/core/theme/languages.dart';

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


enum ModuleType {
  square,
  circle;

  String get displayName {
    switch (this) {
      case ModuleType.square:
        return 'Square';
      case ModuleType.circle:
        return 'Circle';
    }
  }
}


enum EyeType {
  square,
  circle;

  String get displayName {
    switch (this) {
      case EyeType.square:
        return 'Square';
      case EyeType.circle:
        return 'Circle';
    }
  }
}

enum QrType {
  create,
  clone
}
