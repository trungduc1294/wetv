import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';

// [VN] Panel scroll ngang hiển thị chi tiết phim theo nhiều section liền mạch
class MovieDetailHorizontalPanel extends StatelessWidget {
  const MovieDetailHorizontalPanel({
    super.key,
    required this.detail,
    this.height = 240,
    this.sectionSpacing = 24,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.imageRadius = 12,
    this.onAddToPlaylist,
    this.onSideSceneTap,
    this.onMoreSideScenesTap,
  });

  // [VN] Dữ liệu chi tiết phim
  final MovieDetailInfo detail;
  // [VN] Chiều cao cố định của panel
  final double height;
  // [VN] Khoảng cách giữa các section
  final double sectionSpacing;
  final EdgeInsetsGeometry padding;
  final double imageRadius;
  // [VN] Callback khi bấm icon thêm vào playlist
  final VoidCallback? onAddToPlaylist;
  // [VN] Callback khi bấm một cảnh bên lề
  final void Function(MovieSideScene scene)? onSideSceneTap;
  // [VN] Callback khi bấm nút xem thêm cảnh bên lề
  final VoidCallback? onMoreSideScenesTap;

  @override
  Widget build(BuildContext context) {
    // [VN] Mỗi section rộng gần full màn, chừa mép để lộ section kế tiếp
    final screenWidth = MediaQuery.sizeOf(context).width;
    final resolvedPadding = padding.resolve(Directionality.of(context));
    final sectionWidth = screenWidth - resolvedPadding.left - 72;

    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      color: AppColors.gray_900,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: padding,
        children: [
          // [VN] Section 1: poster, tên, tag, mô tả ngắn, icon playlist
          SizedBox(
            width: sectionWidth,
            child: _OverviewSection(
              detail: detail,
              imageRadius: imageRadius,
              onAddToPlaylist: onAddToPlaylist,
            ),
          ),
          SizedBox(width: sectionSpacing),
          // [VN] Section 2: slider ảnh đẹp
          SizedBox(
            width: sectionWidth,
            child: _FeaturedImagesSection(
              images: detail.featuredImages,
              imageRadius: imageRadius,
            ),
          ),
          SizedBox(width: sectionSpacing),
          // [VN] Section 3: đánh giá người dùng
          SizedBox(
            width: sectionWidth,
            child: _ReviewsSection(reviews: detail.reviews),
          ),
          SizedBox(width: sectionSpacing),
          // [VN] Section 4: tóm tắt nội dung (clip nếu vượt chiều cao)
          SizedBox(
            width: sectionWidth,
            child: _SummarySection(summary: detail.summary),
          ),
          SizedBox(width: sectionSpacing),
          // [VN] Section 5: danh sách cảnh bên lề
          SizedBox(
            width: sectionWidth,
            child: _SideScenesSection(
              scenes: detail.sideScenes,
              imageRadius: imageRadius,
              onSideSceneTap: onSideSceneTap,
              onMoreSideScenesTap: onMoreSideScenesTap,
            ),
          ),
        ],
      ),
    );
  }
}

// [VN] Section tổng quan: poster + thông tin cơ bản của phim
class _OverviewSection extends StatelessWidget {
  const _OverviewSection({
    required this.detail,
    required this.imageRadius,
    this.onAddToPlaylist,
  });

  final MovieDetailInfo detail;
  final double imageRadius;
  final VoidCallback? onAddToPlaylist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [VN] Poster ngang bo góc
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imageRadius),
            child: Image.network(
              detail.posterUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // [VN] Tên phim
        Text(
          detail.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.white_primary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        // [VN] Hàng tag + icon thêm playlist
        Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i < detail.tags.length; i++) ...[
                      if (i > 0) const SizedBox(width: 6),
                      _TagChip(tag: detail.tags[i]),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: onAddToPlaylist,
              child: const Icon(
                Icons.playlist_add,
                color: AppColors.white_primary,
                size: 24,
              ),
            ),
          ],
        ),
        // [VN] Mô tả ngắn một dòng
        if (detail.shortDescription.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            detail.shortDescription,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.gray_600, fontSize: 12),
          ),
        ],
      ],
    );
  }
}

// [VN] Chip tag phim: filled = nền cam đặc, ngược lại chỉ viền cam
class _TagChip extends StatelessWidget {
  const _TagChip({required this.tag});

  final MovieTag tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: tag.filled ? AppColors.orange_primary : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.orange_primary, width: 1),
      ),
      child: Text(
        tag.label,
        style: const TextStyle(
          color: AppColors.white_primary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// [VN] Section slider trình chiếu ảnh nổi bật của phim
class _FeaturedImagesSection extends StatefulWidget {
  const _FeaturedImagesSection({
    required this.images,
    required this.imageRadius,
  });

  final List<String> images;
  final double imageRadius;

  @override
  State<_FeaturedImagesSection> createState() => _FeaturedImagesSectionState();
}

class _FeaturedImagesSectionState extends State<_FeaturedImagesSection> {
  late final PageController _controller;
  // [VN] Index ảnh đang hiển thị trong slider
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TrKeys.beautifulPhotos.tr,
          style: const TextStyle(
            color: AppColors.white_primary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: images.isEmpty
              ? const SizedBox.shrink()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(widget.imageRadius),
                  child: Stack(
                    children: [
                      // [VN] Slider ảnh
                      PageView.builder(
                        controller: _controller,
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },
                        itemBuilder: (context, index) {
                          return Image.network(
                            images[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      // [VN] Indicator chấm khi có nhiều hơn 1 ảnh
                      if (images.length > 1)
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(images.length, (index) {
                              final active = index == _currentIndex;
                              return Container(
                                width: active ? 8 : 6,
                                height: active ? 8 : 6,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: active
                                      ? AppColors.white_primary
                                      : AppColors.white_primary.withValues(
                                          alpha: 0.4,
                                        ),
                                ),
                              );
                            }),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

// [VN] Section danh sách đánh giá người dùng
class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection({required this.reviews});

  final List<MovieReview> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TrKeys.reviews.tr,
          style: const TextStyle(color: AppColors.gray_600, fontSize: 13),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: reviews.isEmpty
              ? const SizedBox.shrink()
              // [VN] Chỉ hiển thị tối đa 2 đánh giá trong panel
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviews.length.clamp(0, 2),
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return _ReviewItem(review: reviews[index]);
                  },
                ),
        ),
      ],
    );
  }
}

// [VN] Một item đánh giá: avatar, tên, ngày, nội dung
class _ReviewItem extends StatelessWidget {
  const _ReviewItem({required this.review});

  final MovieReview review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // [VN] Header: avatar + tên + thời gian
        Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.gray_800,
              backgroundImage: review.avatarUrl.isNotEmpty
                  ? NetworkImage(review.avatarUrl)
                  : null,
              child: review.avatarUrl.isEmpty
                  ? const Icon(
                      Icons.person,
                      size: 16,
                      color: AppColors.white_primary,
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      review.userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white_primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (review.date.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Text(
                      review.date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.gray_600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // [VN] Nội dung đánh giá
        Text(
          review.comment,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.white_primary,
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

// [VN] Section tóm tắt nội dung phim; text dài sẽ bị clip theo chiều cao
class _SummarySection extends StatelessWidget {
  const _SummarySection({required this.summary});

  final String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TrKeys.contentSummary.tr,
          style: const TextStyle(color: AppColors.gray_600, fontSize: 13),
        ),
        const SizedBox(height: 12),
        // [VN] ClipRect cắt phần text vượt quá chiều cao còn lại
        Expanded(
          child: ClipRect(
            child: Text(
              summary,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                color: AppColors.white_primary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// [VN] Section danh sách cảnh bên lề + nút xem thêm
class _SideScenesSection extends StatelessWidget {
  const _SideScenesSection({
    required this.scenes,
    required this.imageRadius,
    this.onSideSceneTap,
    this.onMoreSideScenesTap,
  });

  final List<MovieSideScene> scenes;
  final double imageRadius;
  final void Function(MovieSideScene scene)? onSideSceneTap;
  final VoidCallback? onMoreSideScenesTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TrKeys.sideScenes.tr,
          style: const TextStyle(
            color: AppColors.white_primary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: scenes.isEmpty
              ? const SizedBox.shrink()
              // [VN] Chỉ hiển thị tối đa 3 cảnh trong panel
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: scenes.length.clamp(0, 3),
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final scene = scenes[index];
                    return _SideSceneItem(
                      scene: scene,
                      imageRadius: imageRadius,
                      onTap: () => onSideSceneTap?.call(scene),
                    );
                  },
                ),
        ),
        const SizedBox(height: 10),
        // [VN] Nút mở thêm đoạn phim độc quyền
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: onMoreSideScenesTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.gray_800,
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                TrKeys.moreExclusiveClips.tr,
                style: const TextStyle(color: AppColors.white_primary, fontSize: 13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// [VN] Một item cảnh bên lề: thumbnail + thời lượng + tiêu đề
class _SideSceneItem extends StatelessWidget {
  const _SideSceneItem({
    required this.scene,
    required this.imageRadius,
    this.onTap,
  });

  final MovieSideScene scene;
  final double imageRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              width: 120,
              height: 68,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(scene.thumbnailUrl, fit: BoxFit.cover),
                  ),
                  // [VN] Badge thời lượng góc dưới phải thumbnail
                  if (scene.duration.isNotEmpty)
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.orange_secondary.withValues(
                            alpha: 0.9,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          scene.duration,
                          style: const TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              scene.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.white_primary,
                fontSize: 13,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
