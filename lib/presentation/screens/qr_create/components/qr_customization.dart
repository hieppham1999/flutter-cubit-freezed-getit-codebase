import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/constants/enums.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_decoration.dart';
import 'package:flutter_cubit_freezed_getit_codebase/domain/entities/qr_model/qr_model.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_dropdown.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/app_tile.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/color_picker_dot.dart';

class QrCustomization extends StatefulWidget {
  const QrCustomization({super.key, this.initModel, required this.onChanged});

  final QrModel? initModel;
  final Function(QrModel model) onChanged;

  @override
  State<QrCustomization> createState() => _QrCustomizationState();
}

class _QrCustomizationState extends State<QrCustomization> {
  late QrModel _current = widget.initModel ?? QrModel.df();

  final rowSpace = SizedBox(height: 8);

  void _updateDecoration(
      QrDecoration Function(QrDecoration) onUpdate) {
    final newDecoration = onUpdate(_current.decoration);
    setState(() => _current = _current.copyWith(decoration: newDecoration));
    widget.onChanged(_current);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Qr Module'),

        AppTile(
          label: 'Module color:',
          trailing: ColorPickerDot(
            selectedColor: Color(_current.decoration.moduleStyle.color),
            onChanged: (color) {
              _updateDecoration((deco) => deco.copyWith(
                    moduleStyle: deco.moduleStyle.copyWith(color: color.value),
                  ));
            },
          ),
        ),
        rowSpace,

        AppTile(
          label: 'Module type:',
          trailing: AppDropdown<ModuleType>(
            items: ModuleType.values,
            value: _current.decoration.moduleStyle.shape,
            onChanged: (ModuleType? value) {
              if (value == null) return;
              _updateDecoration((deco) => deco.copyWith(
                    moduleStyle: deco.moduleStyle.copyWith(shape: value),
                  ));
            },
            itemBuilder: (ModuleType item) {
              return Text(item.displayName);
            },
          ),
        ),

        rowSpace,

        Text('Qr Eye'),

        AppTile(
          label: 'Eye color:',
          trailing: ColorPickerDot(
            selectedColor: Color(_current.decoration.eyeStyle.color),
            onChanged: (color) {
              _updateDecoration((deco) => deco.copyWith(
                    eyeStyle: deco.eyeStyle.copyWith(color: color.value),
                  ));
            },
          ),
        ),
        rowSpace,

        AppTile(
          label: 'Eye type:',
          trailing: AppDropdown<EyeType>(
            items: EyeType.values,
            value: _current.decoration.eyeStyle.shape,
            onChanged: (EyeType? value) {
              if (value == null) return;
              _updateDecoration((deco) => deco.copyWith(
                    eyeStyle: deco.eyeStyle.copyWith(shape: value),
                  ));
            },
            itemBuilder: (EyeType item) {
              return Text(item.displayName);
            },
          ),
        ),

        rowSpace,

        AppTile(
          label: 'Background color:',
          trailing: ColorPickerDot(
            selectedColor: Color(_current.decoration.backgroundColor),
            onChanged: (color) {
              _updateDecoration((deco) => deco.copyWith(
                    backgroundColor: color.value,
                  ));
            },
          ),
        ),
      ],
    );
  }
}
