import 'package:flutter/material.dart';

enum ItemWeightType { labelBias, valueBias, byRatio }

class AppTile extends StatelessWidget {
  const AppTile({
    super.key,
    required this.label,
    this.onValueTap,
    this.trailing,
    this.labelFlex = 1,
    this.valueFlex = 1,
    this.weightType = ItemWeightType.labelBias,
    this.isBold = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.labelSize,
    this.labelColor,
  });

  final VoidCallback? onValueTap;
  final String label;
  final Widget? trailing;
  final ItemWeightType weightType;
  final int labelFlex;
  final int valueFlex;
  final bool isBold;
  final CrossAxisAlignment crossAxisAlignment;
  final double? labelSize;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        _buildLabelWithWeight(context),
        if (trailing != null) _buildValueWithWeight(),
      ],
    );
  }

  Widget _buildLabelWithWeight(BuildContext context) {
    switch (weightType) {
      case ItemWeightType.labelBias || ItemWeightType.byRatio:
        return Expanded(flex: labelFlex, child: _buildLabel(context));
      default:
        return _buildLabel(context);
    }
  }

  Widget _buildValueWithWeight() {
    switch (weightType) {
      case ItemWeightType.valueBias || ItemWeightType.byRatio:
        return Expanded(flex: valueFlex, child: _buildValueWithUserGesture());
      default:
        return _buildValueWithUserGesture();
    }
  }

  Widget _buildLabel(BuildContext context) {
    if (isBold) {
      return Text(
        label,
        style: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(fontSize: labelSize, color: labelColor),
      );
    } else {
      return Text(
        label,
        style: TextTheme.of(
          context,
        ).bodyLarge?.copyWith(fontSize: labelSize, color: labelColor),
      );
    }
  }

  Widget _buildValueWithUserGesture() {
    if (onValueTap != null) {
      return GestureDetector(onTap: onValueTap, child: trailing);
    } else {
      return trailing!;
    }
  }
}
