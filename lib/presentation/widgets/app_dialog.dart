import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/app/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/navigation/app_navigator.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/theme/dimensions.dart';

/// Confirmation dialog.
///
/// Closing goes through [NavController.pop], not `Navigator.of(context)`:
/// navigation has exactly one door (see `core/navigation/app_navigator.dart`).
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.body,
    this.onPositive,
    this.onNegative,
    this.positiveText,
    this.negativeText,
    this.returnResultValue,
  });

  final String? title;
  final Widget? body;
  final VoidCallback? onPositive;
  final VoidCallback? onNegative;
  final String? positiveText;
  final String? negativeText;
  final dynamic Function()? returnResultValue;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.large)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.small),
                child: Center(
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            if (body != null) body!,
            const SizedBox(height: AppSpacing.large),

            /// `Wrap`, not `Row`. Two buttons keeping their natural width inside
            /// an unflexed `Row` overflow as soon as the label pair gets a
            /// little long, and at large text scales essentially every pair
            /// does. `Wrap` lets them move to a second line instead of being
            /// clipped.
            Wrap(
              alignment: WrapAlignment.end,
              spacing: AppSpacing.small,
              runSpacing: AppSpacing.small,
              children: [
                /// Positive
                ElevatedButton(
                  onPressed: () {
                    onPositive?.call();
                    NavController.pop(returnResultValue?.call());
                  },
                  child: Text(positiveText ?? Languages.translate.dialogYes),
                ),

                /// Negative
                ElevatedButton(
                  onPressed: () {
                    onNegative?.call();
                    NavController.pop();
                  },
                  child: Text(negativeText ?? Languages.translate.dialogNo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
