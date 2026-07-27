import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/wallet_models.dart';

// [VN] Card một gói nạp coins
class CoinPackageCard extends StatelessWidget {
  const CoinPackageCard({
    super.key,
    required this.package,
    this.onTap,
  });

  final CoinPackage package;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    package.amount >= 10000
                        ? Icons.inventory_2
                        : Icons.monetization_on,
                    color: const Color(0xFFE6A800),
                    size: package.amount >= 10000 ? 36 : 32,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${package.amount}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF1D6),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(9),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                package.priceLabel,
                style: const TextStyle(
                  color: Color(0xFFB8860B),
                  fontSize: 13,
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
