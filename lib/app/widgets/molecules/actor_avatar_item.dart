import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';

// [VN] Avatar diễn viên + tên, dùng trong list ngang
class ActorAvatarItem extends StatelessWidget {
  const ActorAvatarItem({
    super.key,
    required this.actor,
    this.onTap,
    this.size = 64,
  });

  final ActorModel actor;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size + 8,
        child: Column(
          children: [
            CircleAvatar(
              radius: size / 2,
              backgroundColor: AppColors.gray_800,
              backgroundImage: actor.avatarUrl.isNotEmpty
                  ? NetworkImage(actor.avatarUrl)
                  : null,
              child: actor.avatarUrl.isEmpty
                  ? const Icon(Icons.person, color: AppColors.white_primary)
                  : null,
            ),
            const SizedBox(height: 6),
            Text(
              actor.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white_primary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
