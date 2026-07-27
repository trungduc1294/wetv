import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Tiêu đề section kèm link bên phải (tuỳ chọn)
class SectionHeaderLink extends StatelessWidget {
  const SectionHeaderLink({
    super.key,
    required this.title,
    this.actionLabel,
    this.onActionTap,
    this.titleColor = AppColors.primary,
    this.actionColor = AppColors.gray_600,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final Color titleColor;
  final Color actionColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (actionLabel != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionLabel!,
              style: TextStyle(
                color: actionColor,
                fontSize: 13,
              ),
            ),
          ),
      ],
    );
  }
}
