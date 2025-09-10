import 'package:flutter/material.dart';

class ReadOnlyTextBox extends StatelessWidget {
  const ReadOnlyTextBox({super.key, required this.text, this.margin});

  final String text;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 50,
      margin: margin,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Text(text),
    );
  }
}
