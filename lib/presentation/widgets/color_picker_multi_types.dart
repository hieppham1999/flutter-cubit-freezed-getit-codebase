
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MultipleTypeColorPicker extends StatefulWidget {
  const MultipleTypeColorPicker({
    super.key,
    this.initColor = Colors.white,
    required this.onChanged,
  });

  final Color? initColor;
  final Function(Color color) onChanged;

  @override
  State<MultipleTypeColorPicker> createState() =>
      _MultipleTypeColorPickerState();
}

class _MultipleTypeColorPickerState extends State<MultipleTypeColorPicker> {
  late Color _currentColor = widget.initColor ??  Colors.white;

  set currentColor(Color color) {
    setState(() {
      _currentColor = color;
    });
    widget.onChanged.call(color);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: const <Widget>[
              Tab(text: 'HSV/HSL/RGB'),
              Tab(text: 'Material'),
              Tab(text: 'Blocky'),
            ],
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  SingleChildScrollView(
                    child: ColorPicker(
                      pickerColor: _currentColor,
                      // colorPickerWidth: 300,
                      onColorChanged: (color) => currentColor = color,
                    ),
                  ),
                  MaterialPicker(
                    pickerColor: _currentColor,
                    onColorChanged: (color) => currentColor = color,
                  ),
                  BlockPicker(
                    pickerColor: _currentColor,
                    onColorChanged: (color) => currentColor = color,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
