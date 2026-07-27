import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Chip số tập phim
class EpisodeChip extends StatelessWidget {
  const EpisodeChip({
    super.key,
    required this.number,
    this.selected = false,
    this.onTap,
    this.size,
  });

  final int number;
  final bool selected;
  final VoidCallback? onTap;
  // [VN] null = chiếm full không gian cha (dùng trong Grid)
  final double? size;

  @override
  Widget build(BuildContext context) {
    final label = number.toString().padLeft(2, '0');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF3A2418)
              : AppColors.gray_800,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? AppColors.orange_primary
                : AppColors.white_primary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
