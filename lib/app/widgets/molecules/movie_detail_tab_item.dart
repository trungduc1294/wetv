import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Item tab chi tiết phim: text + underline cam khi active
class MovieDetailTabItem extends StatelessWidget {
  const MovieDetailTabItem({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.showPlayIcon = false,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool showPlayIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: selected
                        ? AppColors.white_primary
                        : AppColors.gray_600,
                    fontSize: 14,
                    fontWeight:
                        selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                if (showPlayIcon) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.play_circle_fill,
                    size: 14,
                    color: selected
                        ? AppColors.orange_primary
                        : AppColors.gray_600,
                  ),
                ],
              ],
            ),
            const SizedBox(height: 6),
            Container(
              height: 3,
              width: 28,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.orange_primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
