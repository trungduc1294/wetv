import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Badge phân loại độ tuổi (T13, ...)
class RatingBadge extends StatelessWidget {
  const RatingBadge({
    super.key,
    required this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  final String label;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(4),
        border: const Border(
          left: BorderSide(color: AppColors.orange_primary, width: 2),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.white_primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
