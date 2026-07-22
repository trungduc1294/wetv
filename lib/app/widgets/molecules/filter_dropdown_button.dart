import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Nút dropdown filter bên trái thanh filter BXH
class FilterDropdownButton extends StatelessWidget {
  const FilterDropdownButton({
    super.key,
    required this.label,
    this.expanded = false,
    this.onTap,
  });

  final String label;
  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white_primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: AppColors.white_primary,
            size: 18,
          ),
        ],
      ),
    );
  }
}
