import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Nút action bên phải short: icon + số/label bên dưới
class ShortsActionButton extends StatelessWidget {
  const ShortsActionButton({
    super.key,
    required this.icon,
    this.label = '',
    this.onTap,
    this.iconSize = 28,
    this.color = AppColors.white_primary,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final double iconSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: iconSize),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
