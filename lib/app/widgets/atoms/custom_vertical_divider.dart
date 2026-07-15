import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
    this.margin,
    this.color = AppColors.white_primary,
    this.height = 16,
    this.width = 0.5,
  });
  final EdgeInsets? margin;
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      margin: margin,
    );
  }
}
