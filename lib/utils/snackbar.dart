import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

void showSnackBar(
  BuildContext context, {
  String message = '',
  Duration duration = const Duration(seconds: 2),
}) async {
  await Flushbar(
    message: message,
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    duration: duration,
  ).show(context);
}
