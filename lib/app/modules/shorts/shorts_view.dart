import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/modules/shorts/shorts_controller.dart';
import 'package:wetv/app/widgets/molecules/filter_chip_item.dart';
import 'package:wetv/app/widgets/molecules/movie_grid.dart';
import 'package:wetv/app/widgets/molecules/shorts_tab_header.dart';
import 'package:wetv/app/widgets/organisms/shorts_for_you_feed.dart';

// [VN] Màn hình Shorts: For You (lướt video) + All (grid phim)
class ShortsView extends GetView<ShortsController> {
  ShortsView({super.key}) {
    Get.put(ShortsController());
  }

  @override
  Widget build(BuildContext context) {
    // [VN] Một Obx duy nhất tránh nested Obx improper use
    return Obx(() {
      final tabIndex = controller.mainTabIndex.value;

      return Column(
        children: [
          ShortsTabHeader(
            selectedIndex: tabIndex,
            onTabChanged: controller.changeMainTab,
            onMoreTap: controller.onMoreTap,
            showLogo: tabIndex == 0,
          ),
          Expanded(
            child: tabIndex == 0 ? _buildForYouTab() : _buildAllTab(),
          ),
        ],
      );
    });
  }

  // [VN] Tab For You: PageView dọc short video
  Widget _buildForYouTab() {
    final videos = controller.videos.toList();
    final currentIndex = controller.currentVideoIndex.value;
    final isPaused = controller.isPaused.value;

    return ShortsForYouFeed(
      videos: videos,
      currentIndex: currentIndex,
      isPaused: isPaused,
      onPageChanged: controller.onPageChanged,
      onTogglePlay: controller.togglePlay,
      onLike: controller.onLike,
      onAdd: controller.onAdd,
      onShare: controller.onShare,
      onSeriesTap: controller.onSeriesTap,
      onMoreDescription: controller.onMoreDescription,
    );
  }

  // [VN] Tab All: chip filter + grid phim
  Widget _buildAllTab() {
    final selectedChip = controller.selectedChipIndex.value;
    final movies = controller.allMovies.toList();

    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: controller.chipLabels.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return Center(
                child: FilterChipItem(
                  label: controller.chipLabels[index],
                  selected: selectedChip == index,
                  filledWhenSelected: true,
                  onTap: () => controller.selectChip(index),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: MovieGrid(
            movies: movies,
            crossAxisCount: 3,
            imageAspectRatio: 2 / 3,
            showTitle: true,
            showDescription: true,
            maxLines: 1,
            descriptionMaxLines: 1,
            spacing: 8,
            spacingY: 12,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            onMovieTap: controller.onMovieTap,
          ),
        ),
      ],
    );
  }
}
