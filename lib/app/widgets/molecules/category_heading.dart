import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

class CategoryHeading extends StatelessWidget {
  const CategoryHeading({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  final String title;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.white_primary,
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(icon!, color: AppColors.gray_600, size: 18),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
