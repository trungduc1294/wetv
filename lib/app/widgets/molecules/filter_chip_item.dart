import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Chip filter ngang: hỗ trợ style text / viền cam / nền cam
class FilterChipItem extends StatelessWidget {
  const FilterChipItem({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.highlightBorder = false,
    this.filledWhenSelected = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  // [VN] true = viền cam khi selected (kiểu BXH chip)
  final bool highlightBorder;
  // [VN] true = nền cam khi selected (kiểu filter chip)
  final bool filledWhenSelected;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final Color textColor;
    if (selected && (filledWhenSelected || !highlightBorder)) {
      textColor = filledWhenSelected
          ? AppColors.white_primary
          : AppColors.orange_primary;
    } else if (selected && highlightBorder) {
      textColor = AppColors.white_primary;
    } else {
      textColor = AppColors.white_primary;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: selected && filledWhenSelected
              ? AppColors.orange_primary
              : AppColors.gray_800,
          borderRadius: BorderRadius.circular(20),
          border: selected && highlightBorder
              ? Border.all(color: AppColors.orange_primary, width: 1)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
