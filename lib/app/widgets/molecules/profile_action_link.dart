import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Link hành động dạng text + chevron (dùng trong ProfileCard)
class ProfileActionLink extends StatelessWidget {
  const ProfileActionLink({
    super.key,
    required this.label,
    this.onTap,
    this.labelStyle = const TextStyle(
      color: AppColors.white_primary,
      fontSize: 13,
    ),
    this.iconSize = 14,
  });

  final String label;
  final VoidCallback? onTap;
  final TextStyle labelStyle;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: labelStyle),
          Icon(
            Icons.chevron_right,
            color: labelStyle.color ?? AppColors.white_primary,
            size: iconSize,
          ),
        ],
      ),
    );
  }
}
