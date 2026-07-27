import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';

// [VN] Item hàng trong BXH nhân vật
class CharacterRankListItem extends StatelessWidget {
  const CharacterRankListItem({
    super.key,
    required this.character,
    this.onSendLove,
  });

  final CharacterRankModel character;
  final VoidCallback? onSendLove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: character.rank == 1
                ? const Icon(Icons.workspace_premium,
                    color: Color(0xFFD4AF37), size: 22)
                : Text(
                    '${character.rank}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.gray_800,
            backgroundImage: character.avatarUrl.isNotEmpty
                ? NetworkImage(character.avatarUrl)
                : null,
            child: character.avatarUrl.isEmpty
                ? const Icon(Icons.person, color: AppColors.white_primary)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (character.movieTitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    character.movieTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.gray_600,
                      fontSize: 11,
                    ),
                  ),
                ],
                if (character.badge.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.orange_primary),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      character.badge,
                      style: const TextStyle(
                        color: AppColors.orange_primary,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.favorite,
                  color: AppColors.orange_primary, size: 14),
              const SizedBox(width: 2),
              Text(
                character.heartCount,
                style: const TextStyle(
                  color: AppColors.orange_primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onSendLove,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange_primary,
              foregroundColor: AppColors.white_primary,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Send Love', style: TextStyle(fontSize: 11)),
          ),
        ],
      ),
    );
  }
}
