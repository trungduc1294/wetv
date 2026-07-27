import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';
import 'package:wetv/app/modules/movie_detail/movie_detail_controller.dart';
import 'package:wetv/app/widgets/molecules/character_heart_card.dart';
import 'package:wetv/app/widgets/molecules/character_rank_list_item.dart';
import 'package:wetv/app/widgets/molecules/movie_grid.dart';
import 'package:wetv/app/widgets/molecules/side_scene_grid_card.dart';
import 'package:wetv/app/widgets/organisms/actor_horizontal_list.dart';
import 'package:wetv/app/widgets/organisms/actor_profile_panel.dart';
import 'package:wetv/app/widgets/organisms/episode_chip_list.dart';
import 'package:wetv/app/widgets/organisms/episode_select_panel.dart';
import 'package:wetv/app/widgets/organisms/movie_action_icon_row.dart';
import 'package:wetv/app/widgets/organisms/movie_detail_player_header.dart';
import 'package:wetv/app/widgets/organisms/movie_detail_tab_bar.dart';
import 'package:wetv/app/widgets/organisms/movie_intro_panel.dart';

// [VN] Màn hình chi tiết / xem phim
class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = controller.detail;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          MovieDetailPlayerHeader(
            bannerUrl: detail.bannerUrl,
            ratingLabel: detail.ratingLabel,
            onBack: controller.onBack,
            onCast: controller.onCast,
          ),
          Obx(
            () => MovieDetailTabBar(
              tabs: controller.tabs
                  .map(
                    (t) => MovieDetailTab(
                      label: t.label,
                      showPlayIcon: t.showPlayIcon,
                    ),
                  )
                  .toList(),
              selectedIndex: controller.selectedTabIndex.value,
              onTabChanged: controller.changeTab,
            ),
          ),
          Expanded(
            child: Obx(() {
              switch (controller.selectedTabIndex.value) {
                case 0:
                  return _DetailTab(
                    detail: detail,
                    selectedEpisode: controller.selectedEpisode.value,
                    onIntroTap: () => _openIntroPanel(context),
                    onEpisodeMoreTap: () => _openEpisodePanel(context),
                    onEpisodeTap: controller.selectEpisode,
                    onActorTap: (actor) => _openActorPanel(context, actor),
                    onAdd: controller.onAdd,
                    onDownload: controller.onDownload,
                    onShare: controller.onShare,
                    onLike: controller.onLike,
                    onRecommendTap: controller.onRecommendTap,
                  );
                case 1:
                  return _SideScenesTab(
                    scenes: detail.sideScenes,
                    onTap: controller.onSideSceneTap,
                  );
                case 2:
                  return _PhotosTab(photos: detail.photos);
                case 3:
                  return _HeartRankTab(
                    characters: detail.heartRanks,
                    onSendHeart: controller.onSendHeart,
                  );
                case 4:
                  return _CharacterRankTab(
                    characters: detail.characterRanks,
                    onSendLove: controller.onSendLove,
                  );
                default:
                  return const SizedBox.shrink();
              }
            }),
          ),
        ],
      ),
    );
  }

  void _openEpisodePanel(BuildContext context) {
    Get.bottomSheet(
      Obx(
        () => EpisodeSelectPanel(
          totalEpisodes: controller.detail.totalEpisodes,
          selectedEpisode: controller.selectedEpisode.value,
          versionLabel: controller.detail.versionLabel,
          onEpisodeTap: (ep) {
            controller.selectEpisode(ep);
            Get.back();
          },
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void _openIntroPanel(BuildContext context) {
    final detail = controller.detail;
    Get.bottomSheet(
      MovieIntroPanel(
        title: detail.title,
        tags: [detail.year, ...detail.tags],
        synopsis: detail.synopsis,
        reviews: detail.reviews,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void _openActorPanel(BuildContext context, ActorModel actor) {
    Get.bottomSheet(
      ActorProfilePanel(
        actor: actor,
        onWorkTap: controller.onWorkTap,
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}

// [VN] Tab Chi tiết (Ảnh 1)
class _DetailTab extends StatelessWidget {
  const _DetailTab({
    required this.detail,
    required this.selectedEpisode,
    required this.onIntroTap,
    required this.onEpisodeMoreTap,
    required this.onEpisodeTap,
    required this.onActorTap,
    required this.onAdd,
    required this.onDownload,
    required this.onShare,
    required this.onLike,
    required this.onRecommendTap,
  });

  final MovieWatchDetail detail;
  final int selectedEpisode;
  final VoidCallback onIntroTap;
  final VoidCallback onEpisodeMoreTap;
  final void Function(int episode) onEpisodeTap;
  final void Function(ActorModel actor) onActorTap;
  final VoidCallback onAdd;
  final VoidCallback onDownload;
  final VoidCallback onShare;
  final VoidCallback onLike;
  final void Function(MovieModel movie) onRecommendTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  detail.title,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onIntroTap,
                child: const Row(
                  children: [
                    Text(
                      'Giới thiệu',
                      style: TextStyle(
                        color: AppColors.gray_600,
                        fontSize: 13,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.gray_600,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              if (detail.score.isNotEmpty) ...[
                const Icon(Icons.star,
                    color: AppColors.orange_primary, size: 16),
                const SizedBox(width: 4),
                Text(
                  detail.score,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('•', style: TextStyle(color: AppColors.gray_600)),
                const SizedBox(width: 8),
              ],
              Text(
                '${detail.episodeCount} tập',
                style: const TextStyle(color: AppColors.gray_600, fontSize: 13),
              ),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: AppColors.gray_600)),
              const SizedBox(width: 8),
              Text(
                detail.year,
                style: const TextStyle(color: AppColors.gray_600, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: detail.tags
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.gray_800,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: AppColors.gray_600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: onEpisodeMoreTap,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    detail.versionLabel,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.white_primary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        EpisodeChipList(
          totalEpisodes: detail.totalEpisodes,
          selectedEpisode: selectedEpisode,
          onEpisodeTap: onEpisodeTap,
        ),
        const SizedBox(height: 8),
        MovieActionIconRow(
          onAdd: onAdd,
          onDownload: onDownload,
          onShare: onShare,
          onLike: onLike,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 10),
          child: Text(
            'Diễn viên',
            style: TextStyle(
              color: AppColors.white_primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ActorHorizontalList(
          actors: detail.actors,
          onActorTap: onActorTap,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 10),
          child: Text(
            'Đề xuất cho bạn',
            style: TextStyle(
              color: AppColors.white_primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: MovieGrid(
            movies: detail.recommendations,
            crossAxisCount: 2,
            imageAspectRatio: 2 / 3,
            maxLines: 2,
            spacing: 10,
            spacingY: 10,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            onMovieTap: onRecommendTap,
          ),
        ),
      ],
    );
  }
}

// [VN] Tab Cảnh Bên Lề (Ảnh 2)
class _SideScenesTab extends StatelessWidget {
  const _SideScenesTab({required this.scenes, required this.onTap});

  final List<MovieSideScene> scenes;
  final void Function(MovieSideScene scene) onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemCount: scenes.length,
      itemBuilder: (context, index) {
        final scene = scenes[index];
        return SideSceneGridCard(
          scene: scene,
          onTap: () => onTap(scene),
        );
      },
    );
  }
}

// [VN] Tab Ảnh Đẹp (Ảnh 3)
class _PhotosTab extends StatelessWidget {
  const _PhotosTab({required this.photos});

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: photos.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.network(
              photos[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      },
    );
  }
}

// [VN] Tab Thả tim (Ảnh 4)
class _HeartRankTab extends StatelessWidget {
  const _HeartRankTab({
    required this.characters,
    required this.onSendHeart,
  });

  final List<CharacterRankModel> characters;
  final void Function(CharacterRankModel character) onSendHeart;

  @override
  Widget build(BuildContext context) {
    final top3 = characters.take(3).toList();
    final others = characters.skip(3).toList();

    // [VN] Sắp xếp hiển thị: rank2 | rank1 (cao hơn) | rank3
    CharacterRankModel? r1;
    CharacterRankModel? r2;
    CharacterRankModel? r3;
    for (final c in top3) {
      if (c.rank == 1) r1 = c;
      if (c.rank == 2) r2 = c;
      if (c.rank == 3) r3 = c;
    }

    return Container(
      color: AppColors.white_secondary,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE8E8E8)),
            ),
            child: const Row(
              children: [
                Icon(Icons.campaign, color: AppColors.orange_primary, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Thông báo chi tiết',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right, color: AppColors.gray_600, size: 18),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Bảng xếp hạng nhân vật',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE8DE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Bảng tổng kết',
                style: TextStyle(
                  color: AppColors.orange_primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (r1 != null && r2 != null && r3 != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CharacterHeartCard(
                    character: r2,
                    onSendHeart: () => onSendHeart(r2!),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CharacterHeartCard(
                    character: r1,
                    elevated: true,
                    onSendHeart: () => onSendHeart(r1!),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CharacterHeartCard(
                    character: r3,
                    onSendHeart: () => onSendHeart(r3!),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: others.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.62,
            ),
            itemBuilder: (context, index) {
              final c = others[index];
              return CharacterHeartCard(
                character: c,
                onSendHeart: () => onSendHeart(c),
              );
            },
          ),
        ],
      ),
    );
  }
}

// [VN] Tab BXH nhân vật (Ảnh 5)
class _CharacterRankTab extends StatelessWidget {
  const _CharacterRankTab({
    required this.characters,
    required this.onSendLove,
  });

  final List<CharacterRankModel> characters;
  final void Function(CharacterRankModel character) onSendLove;

  @override
  Widget build(BuildContext context) {
    final top1 = characters.isNotEmpty ? characters.first : null;
    final rest = characters.skip(1).toList();

    return ListView(
      children: [
        if (top1 != null)
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.orange_primary, Color(0xFFFF9A5A)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: top1.avatarUrl.isNotEmpty
                          ? NetworkImage(top1.avatarUrl)
                          : null,
                    ),
                    const Positioned(
                      top: -8,
                      left: -4,
                      child: Icon(
                        Icons.workspace_premium,
                        color: Color(0xFFFFD700),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        top1.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        top1.badge.isNotEmpty ? top1.badge : 'TOP1',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Quy tắc >',
                    style: TextStyle(
                      color: AppColors.orange_primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Text(
                'Tháng này',
                style: TextStyle(
                  color: AppColors.orange_primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'Cập nhật gần đây',
                style: TextStyle(color: AppColors.white_primary, fontSize: 12),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.orange_primary,
                size: 18,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...rest.map(
          (c) => CharacterRankListItem(
            character: c,
            onSendLove: () => onSendLove(c),
          ),
        ),
      ],
    );
  }
}
