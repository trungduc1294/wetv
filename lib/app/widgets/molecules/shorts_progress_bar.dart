import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Thanh tiến độ phát short mỏng phía trên bottom nav
class ShortsProgressBar extends StatelessWidget {
  const ShortsProgressBar({
    super.key,
    required this.progress,
    this.height = 2.5,
    this.trackColor = const Color(0x55FFFFFF),
    this.progressColor = AppColors.orange_primary,
    this.showThumb = true,
  });

  // [VN] Giá trị 0.0 - 1.0
  final double progress;
  final double height;
  final Color trackColor;
  final Color progressColor;
  final bool showThumb;

  @override
  Widget build(BuildContext context) {
    final clamped = progress.clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final filled = width * clamped;

        return SizedBox(
          height: showThumb ? 10 : height,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: trackColor,
                  borderRadius: BorderRadius.circular(height),
                ),
              ),
              Container(
                height: height,
                width: filled,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(height),
                ),
              ),
              if (showThumb)
                Positioned(
                  left: (filled - 5).clamp(0.0, width - 10),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: progressColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
