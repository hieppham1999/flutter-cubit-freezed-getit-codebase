import 'package:flutter/material.dart';
import 'package:flutter_cubit_freezed_getit_codebase/core/utils/functions.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: Size.fromHeight(
          56,
        ), // fromHeight use double.infinity as width and 40 is the height
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).primaryColor.isLightColor ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
