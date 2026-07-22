import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Header màn Tài khoản: icon quét QR + thông báo góc phải
class AccountHeader extends StatelessWidget {
  const AccountHeader({
    super.key,
    this.onQrTap,
    this.onNotificationTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
  });

  final VoidCallback? onQrTap;
  final VoidCallback? onNotificationTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: onQrTap,
            icon: const Icon(Icons.qr_code_scanner),
            color: AppColors.white_primary,
          ),
          IconButton(
            onPressed: onNotificationTap,
            icon: const Icon(Icons.notifications_none),
            color: AppColors.white_primary,
          ),
        ],
      ),
    );
  }
}
