import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isReadOnly;
  final ValueChanged<String>? onSubmit;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    this.controller,
    this.isReadOnly = false,
    this.onSubmit,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isReadOnly ? Colors.blue : Colors.grey,
          width: 0.5,
        ),
      ),
      child: AutoSizeTextField(
        controller: controller,
        readOnly: isReadOnly,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        onSubmitted: onSubmit,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter text here...',
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          suffixIcon: suffixIcon,
          // IconButton(
          //   icon: Icon(
          //     isEditable ? Icons.check : Icons.edit,
          //     color: isEditable ? Colors.blue : Colors.grey,
          //   ),
          //   tooltip: isEditable ? 'Submit' : 'Edit',
          //   onPressed: () {
          //     if (isEditable && controller?.text.isNotEmpty == true) {
          //       onSubmit(controller!.text);
          //     }
          //     onToggleEditable?.call();
          //   },
          // ),
        ),
      ),
    );
  }
}
