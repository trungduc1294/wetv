import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Hàng icon hành động: thêm / tải / share / tim
class MovieActionIconRow extends StatelessWidget {
  const MovieActionIconRow({
    super.key,
    this.onAdd,
    this.onDownload,
    this.onShare,
    this.onLike,
  });

  final VoidCallback? onAdd;
  final VoidCallback? onDownload;
  final VoidCallback? onShare;
  final VoidCallback? onLike;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ActionIcon(icon: Icons.add, onTap: onAdd),
          _ActionIcon(icon: Icons.download_outlined, onTap: onDownload),
          _ActionIcon(icon: Icons.reply, onTap: onShare),
          _ActionIcon(icon: Icons.favorite_border, onTap: onLike),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.gray_700, width: 1),
        ),
        child: Icon(icon, color: AppColors.white_primary, size: 22),
      ),
    );
  }
}
