import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/molecules/profile_action_link.dart';

// [VN] Card thông tin tài khoản: avatar, tên, trạng thái VIP, các link hành động
class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userName,
    this.avatarUrl = '',
    this.statusTitle,
    this.statusSubtitle,
    this.onVipCardTap,
    this.onCoinsTap,
    this.onAssetsTap,
    this.borderRadius = 12,
    this.backgroundColor = AppColors.gray_900,
    this.padding = const EdgeInsets.all(16),
  });

  final String userName;
  final String avatarUrl;
  final String? statusTitle;
  final String? statusSubtitle;
  final VoidCallback? onVipCardTap;
  final VoidCallback? onCoinsTap;
  final VoidCallback? onAssetsTap;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [VN] Hàng avatar + tên người dùng
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.gray_800,
                backgroundImage:
                    avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                child: avatarUrl.isEmpty
                    ? const Icon(
                        Icons.person,
                        color: AppColors.white_primary,
                        size: 28,
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // [VN] Trạng thái VIP
          Text(
            statusTitle ?? TrKeys.vipActive.tr,
            style: const TextStyle(
              color: AppColors.white_primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            statusSubtitle ?? TrKeys.enjoyAllFeatures.tr,
            style: const TextStyle(
              color: AppColors.gray_600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          // [VN] Các link nhanh: Thẻ VIP / Coins / Tài sản
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileActionLink(
                label: TrKeys.vipCard.tr,
                onTap: onVipCardTap,
              ),
              ProfileActionLink(
                label: TrKeys.myCoins.tr,
                onTap: onCoinsTap,
              ),
              ProfileActionLink(
                label: TrKeys.myAssets.tr,
                onTap: onAssetsTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
