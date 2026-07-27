import 'package:flutter/material.dart';
import 'package:wetv/app/data/models/short_video_model.dart';
import 'package:wetv/app/widgets/organisms/shorts_video_page.dart';

// [VN] Feed lướt dọc các short video (For You)
class ShortsForYouFeed extends StatelessWidget {
  const ShortsForYouFeed({
    super.key,
    required this.videos,
    required this.currentIndex,
    required this.isPaused,
    required this.onPageChanged,
    required this.onTogglePlay,
    this.onLike,
    this.onAdd,
    this.onShare,
    this.onSeriesTap,
    this.onMoreDescription,
  });

  final List<ShortVideoModel> videos;
  final int currentIndex;
  final bool isPaused;
  final void Function(int index) onPageChanged;
  final VoidCallback onTogglePlay;
  final VoidCallback? onLike;
  final VoidCallback? onAdd;
  final VoidCallback? onShare;
  final VoidCallback? onSeriesTap;
  final VoidCallback? onMoreDescription;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        final video = videos[index];
        // [VN] Chỉ hiện pause icon trên page đang xem
        final paused = isPaused && index == currentIndex;
        return ShortsVideoPage(
          video: video,
          isPaused: paused,
          onTogglePlay: onTogglePlay,
          onLike: onLike,
          onAdd: onAdd,
          onShare: onShare,
          onSeriesTap: onSeriesTap,
          onMoreDescription: onMoreDescription,
        );
      },
    );
  }
}
