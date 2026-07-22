import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Item setting dạng hàng: title bên trái, chevron bên phải
class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    this.onTap,
    this.titleStyle = const TextStyle(
      color: AppColors.white_primary,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    this.iconColor = AppColors.white_primary,
    this.iconSize = 18,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  });

  final String title;
  final VoidCallback? onTap;
  final TextStyle titleStyle;
  final Color iconColor;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: iconColor,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
