import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static String currency(
    num value, {
    String locale = 'en_US',
    String? symbol,
    int decimalDigits = 0,
  }) {
    return NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    ).format(value);
  }

  static String number(num value, {String locale = 'en_US'}) =>
      NumberFormat.decimalPattern(locale).format(value);

  static String date(DateTime value, {String pattern = 'yyyy-MM-dd'}) =>
      DateFormat(pattern).format(value);

  static String dateTime(DateTime value, {String pattern = 'yyyy-MM-dd HH:mm'}) =>
      DateFormat(pattern).format(value);

  static String fileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    const units = ['KB', 'MB', 'GB', 'TB'];
    var size = bytes / 1024;
    var unit = 0;
    while (size >= 1024 && unit < units.length - 1) {
      size /= 1024;
      unit++;
    }
    return '${size.toStringAsFixed(size < 10 ? 2 : 1)} ${units[unit]}';
  }
}

class AppInputFormatters {
  AppInputFormatters._();

  static final TextInputFormatter digitsOnly =
      FilteringTextInputFormatter.digitsOnly;

  static TextInputFormatter maxLength(int length) =>
      LengthLimitingTextInputFormatter(length);

  static final TextInputFormatter noWhitespace =
      FilteringTextInputFormatter.deny(RegExp(r'\s'));
}
