import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';

// [VN] Card nhân vật trong tab Thả tim
class CharacterHeartCard extends StatelessWidget {
  const CharacterHeartCard({
    super.key,
    required this.character,
    this.onSendHeart,
    this.elevated = false,
  });

  final CharacterRankModel character;
  final VoidCallback? onSendHeart;
  final bool elevated;

  Color get _badgeColor {
    switch (character.rank) {
      case 1:
        return const Color(0xFFD4AF37);
      case 2:
        return const Color(0xFFC0C0C0);
      case 3:
        return const Color(0xFFCD7F32);
      default:
        return AppColors.gray_700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
      decoration: BoxDecoration(
        color: AppColors.white_secondary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: elevated ? 36 : 28,
                backgroundColor: AppColors.gray_800,
                backgroundImage: character.avatarUrl.isNotEmpty
                    ? NetworkImage(character.avatarUrl)
                    : null,
                child: character.avatarUrl.isEmpty
                    ? const Icon(Icons.person)
                    : null,
              ),
              if (character.rank == 1)
                const Positioned(
                  top: -14,
                  left: 0,
                  right: 0,
                  child: Icon(Icons.workspace_premium,
                      color: Color(0xFFD4AF37), size: 22),
                ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _badgeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${character.rank}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            character.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite,
                  color: AppColors.orange_primary, size: 12),
              const SizedBox(width: 2),
              Text(
                character.heartCount,
                style: const TextStyle(
                  color: AppColors.orange_primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSendHeart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange_primary,
                foregroundColor: AppColors.white_primary,
                padding: const EdgeInsets.symmetric(vertical: 6),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(TrKeys.sendHeart.tr, style: const TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
