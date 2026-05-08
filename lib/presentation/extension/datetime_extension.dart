import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String format([String pattern = 'yyyy-MM-dd HH:mm']) =>
      DateFormat(pattern).format(this);

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }
}
