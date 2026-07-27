import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/wallet_models.dart';
import 'package:wetv/app/widgets/atoms/app_logo.dart';

// [VN] Preview thẻ VIP gift đang chọn
class VipGiftCardPreview extends StatelessWidget {
  const VipGiftCardPreview({
    super.key,
    required this.card,
    this.height = 180,
  });

  final VipGiftCardOption card;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              card.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(color: AppColors.gray_800),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xAA000000)],
                ),
              ),
            ),
            const Positioned(
              left: 12,
              bottom: 12,
              child: AppLogo(width: 40, height: 40),
            ),
            if (card.priceLabel.isNotEmpty)
              Positioned(
                right: 12,
                bottom: 14,
                child: Text(
                  card.priceLabel,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
