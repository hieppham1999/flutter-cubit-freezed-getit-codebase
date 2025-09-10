import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String? hint;
  final ValueChanged<T?> onChanged;
  final Widget Function(T item) itemBuilder;
  final bool isExpanded;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final Color? dropdownColor;
  final Widget? icon;

  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.value,
    this.hint,
    this.isExpanded = true,
    this.elevation,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0),
    this.dropdownColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          elevation: elevation?.toInt() ?? 8,
          dropdownColor: dropdownColor,
          icon: icon ?? const Icon(Icons.arrow_drop_down),
          hint: hint != null ? Text(hint!) : null,
          onChanged: onChanged,
          isDense: true,
          // itemHeight: 50,
          items: items
              .map((item) => DropdownMenuItem<T>(
            value: item,
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              // margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: itemBuilder(item),
            ),
          ),
          )
              .toList(),
        ),
      ),
    );
  }
}