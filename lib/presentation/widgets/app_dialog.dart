import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.body,
    this.onPositive,
    this.onNegative,
    this.positiveText = 'YES',
    this.negativeText = 'NO',
    this.returnResultValue,
  });

  final String? title;
  final Widget? body;
  final VoidCallback? onPositive;
  final VoidCallback? onNegative;
  final String positiveText;
  final String negativeText;
  final dynamic Function()? returnResultValue;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Center(
                child: Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: body ?? SizedBox.shrink(),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// Positive
                  ElevatedButton(
                    child: Text(positiveText),
                    onPressed: () {
                      onPositive?.call();
                      Navigator.of(context).pop(returnResultValue?.call());
                    },
                  ),
                  SizedBox(width: 8,),

                  /// Negative
                  ElevatedButton(
                    child: Text(negativeText),
                    onPressed: () {
                      onNegative?.call();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}