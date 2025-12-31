import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/presentation/widgets/dialogs.dart';

// const Color _kDefaultSelectedColor = Colors.white;

class ColorPickerDot extends StatelessWidget {
  const ColorPickerDot({
    super.key,
    this.selectedColor,
    this.dotSize = 20,
    required this.onChanged,
  });

  final Color? selectedColor;
  final double dotSize;
  final Function(Color color) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedColor = await pickColor(context, selectedColor);
        if (pickedColor != null) {
          onChanged.call(pickedColor);
        }
      },
      child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
