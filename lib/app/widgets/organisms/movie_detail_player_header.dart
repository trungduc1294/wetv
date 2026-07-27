import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/atoms/app_logo.dart';
import 'package:wetv/app/widgets/molecules/rating_badge.dart';

// [VN] Header player/banner màn chi tiết phim
class MovieDetailPlayerHeader extends StatelessWidget {
  const MovieDetailPlayerHeader({
    super.key,
    required this.bannerUrl,
    this.ratingLabel = 'T13',
    this.height = 220,
    this.onBack,
    this.onCast,
  });

  final String bannerUrl;
  final String ratingLabel;
  final double height;
  final VoidCallback? onBack;
  final VoidCallback? onCast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            bannerUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              color: const Color(0xFF4A1515),
            ),
          ),
          // [VN] Gradient tối phía dưới header
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x99000000),
                ],
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: onBack,
                        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                        color: AppColors.white_primary,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: onCast,
                        icon: const Icon(Icons.cast, size: 22),
                        color: AppColors.white_primary,
                      ),
                      const AppLogo(width: 36, height: 36),
                      const SizedBox(width: 8),
                    ],
                  ),
                  if (ratingLabel.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 4),
                      child: RatingBadge(label: ratingLabel),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
