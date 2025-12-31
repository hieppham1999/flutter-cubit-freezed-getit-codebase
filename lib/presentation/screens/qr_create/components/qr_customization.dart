import 'package:flutter/material.dart';
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
  late final QrModel _current = widget.initModel ?? QrModel();

  final rowSpace = SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Qr Module'),

        AppTile(
          label: 'Module color:',
          trailing: ColorPickerDot(
            selectedColor: _current.moduleStyle.color,
            onChanged: (color) {
              setState(() {
                _current.moduleStyle = _current.moduleStyle.copyWith(
                  color: color,
                );
              });
              widget.onChanged(_current);
            },
          ),
        ),
        rowSpace,

        AppTile(
          label: 'Module type:',
          trailing: AppDropdown<ModuleType>(
            items: ModuleType.values,
            value: _current.moduleStyle.shape,
            onChanged: (ModuleType? value) {
              if (value == null) return;
              setState(() {
                _current.moduleStyle = _current.moduleStyle.copyWith(
                  shape: value,
                );
              });
              widget.onChanged(_current);
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
            selectedColor: _current.eyeStyle.color,
            onChanged: (color) {
              setState(() {
                _current.eyeStyle = _current.eyeStyle.copyWith(color: color);

                // _current = _current.copyWith(
                //   eyeStyle: _current.eyeStyle.copyWith(color: color),
                // );
              });

              widget.onChanged(_current);
            },
          ),
        ),
        rowSpace,

        AppTile(
          label: 'Eye type:',
          trailing: AppDropdown<EyeType>(
            items: EyeType.values,
            value: _current.eyeStyle.shape,
            onChanged: (EyeType? value) {
              if (value == null) return;
              setState(() {
                _current.eyeStyle = _current.eyeStyle.copyWith(
                  shape: value,
                );
              });
              widget.onChanged(_current);
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
            selectedColor: _current.backgroundColor,
            onChanged: (color) {
              setState(() {
                _current.backgroundColor = color;

                // _current = _current.copyWith(backgroundColor: color);
              });

              widget.onChanged(_current);
            },
          ),
        ),
      ],
    );
  }
}
