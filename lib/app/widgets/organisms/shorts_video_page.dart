import 'package:flutter/material.dart';
import 'package:wetv/app/data/models/short_video_model.dart';
import 'package:wetv/app/widgets/organisms/shorts_video_overlay.dart';

// [VN] Một trang short: cover + overlay, tap để play/pause
class ShortsVideoPage extends StatelessWidget {
  const ShortsVideoPage({
    super.key,
    required this.video,
    required this.isPaused,
    required this.onTogglePlay,
    this.onLike,
    this.onAdd,
    this.onShare,
    this.onSeriesTap,
    this.onMoreDescription,
  });

  final ShortVideoModel video;
  final bool isPaused;
  final VoidCallback onTogglePlay;
  final VoidCallback? onLike;
  final VoidCallback? onAdd;
  final VoidCallback? onShare;
  final VoidCallback? onSeriesTap;
  final VoidCallback? onMoreDescription;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTogglePlay,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // [VN] Placeholder video bằng cover image
          Image.network(
            video.coverUrl,
            fit: BoxFit.cover,
          ),
          // [VN] Gradient tối nhẹ phía dưới cho chữ dễ đọc
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0x99000000),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),
          ShortsVideoOverlay(
            video: video,
            isPaused: isPaused,
            onLike: onLike,
            onAdd: onAdd,
            onShare: onShare,
            onSeriesTap: onSeriesTap,
            onMoreDescription: onMoreDescription,
          ),
        ],
      ),
    );
  }
}
