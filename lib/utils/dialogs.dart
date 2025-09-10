import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/languages.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_dialog.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/color_picker_multi_types.dart';

Future<Color?> pickColor(BuildContext context, [Color? currentColor]) async {
  Color? pickedColor;
  return showDialog(
    context: context,
    builder:
        (_) => AppDialog(
          body: SizedBox(
            height: 400,
            child: MultipleTypeColorPicker(
              onChanged: (color) {
                pickedColor = color;
              },
              initColor: currentColor,
            ),
          ),
          positiveText: Languages.translate.buttonSelect,
          negativeText: Languages.translate.buttonCancel,
          returnResultValue: () => pickedColor,
        ),
  );
}
