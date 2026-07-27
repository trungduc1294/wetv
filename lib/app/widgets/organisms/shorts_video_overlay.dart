import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/short_video_model.dart';
import 'package:wetv/app/widgets/molecules/shorts_action_button.dart';
import 'package:wetv/app/widgets/molecules/shorts_progress_bar.dart';

// [VN] Overlay UI trên short: rating, phụ đề, info trái, action phải, progress
class ShortsVideoOverlay extends StatelessWidget {
  const ShortsVideoOverlay({
    super.key,
    required this.video,
    required this.isPaused,
    this.onLike,
    this.onAdd,
    this.onShare,
    this.onSeriesTap,
    this.onMoreDescription,
  });

  final ShortVideoModel video;
  final bool isPaused;
  final VoidCallback? onLike;
  final VoidCallback? onAdd;
  final VoidCallback? onShare;
  final VoidCallback? onSeriesTap;
  final VoidCallback? onMoreDescription;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // [VN] Badge rating góc trên trái
        if (video.ratingLabel.isNotEmpty)
          Positioned(
            top: 56,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(4),
                border: const Border(
                  left: BorderSide(color: AppColors.orange_primary, width: 2),
                ),
              ),
              child: Text(
                video.ratingLabel,
                style: const TextStyle(
                  color: AppColors.white_primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

        // [VN] Icon pause giữa màn khi đang tạm dừng
        if (isPaused)
          const Center(
            child: Icon(
              Icons.pause,
              color: AppColors.white_primary,
              size: 64,
            ),
          ),

        // [VN] Phụ đề giữa dưới
        if (video.subtitlePrimary.isNotEmpty ||
            video.subtitleSecondary.isNotEmpty)
          Positioned(
            left: 24,
            right: 72,
            bottom: 210,
            child: Column(
              children: [
                if (video.subtitlePrimary.isNotEmpty)
                  Text(
                    video.subtitlePrimary,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(blurRadius: 4, color: Colors.black54),
                      ],
                    ),
                  ),
                if (video.subtitleSecondary.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    video.subtitleSecondary,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white_primary.withValues(alpha: 0.85),
                      fontSize: 13,
                      shadows: const [
                        Shadow(blurRadius: 4, color: Colors.black54),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

        // [VN] Cột action bên phải
        Positioned(
          right: 10,
          bottom: 90,
          child: Column(
            children: [
              ShortsActionButton(
                icon: Icons.favorite_border,
                label: '${video.likeCount}',
                onTap: onLike,
              ),
              const SizedBox(height: 20),
              ShortsActionButton(
                icon: Icons.add_box_outlined,
                onTap: onAdd,
              ),
              const SizedBox(height: 20),
              ShortsActionButton(
                icon: Icons.reply,
                onTap: onShare,
              ),
            ],
          ),
        ),

        // [VN] Khối thông tin phim góc dưới trái
        Positioned(
          left: 12,
          right: 72,
          bottom: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      video.thumbnailUrl.isNotEmpty
                          ? video.thumbnailUrl
                          : video.coverUrl,
                      width: 44,
                      height: 58,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (video.genre.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            video.genre,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.gray_600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              if (video.description.isNotEmpty) ...[
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: onMoreDescription,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: video.description,
                          style: const TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 13,
                            height: 1.35,
                          ),
                        ),
                        const TextSpan(
                          text: ' Hơn',
                          style: TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              if (video.seriesLabel.isNotEmpty) ...[
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: onSeriesTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.work_outline,
                          color: AppColors.white_primary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            video.seriesLabel,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.white_primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.white_primary,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              ShortsProgressBar(progress: video.progress),
            ],
          ),
        ),
      ],
    );
  }
}
