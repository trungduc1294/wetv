import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';

// [VN] Bottom panel giới thiệu + đánh giá (Ảnh 7)
class MovieIntroPanel extends StatelessWidget {
  const MovieIntroPanel({
    super.key,
    required this.title,
    required this.tags,
    required this.synopsis,
    required this.reviews,
    this.onClose,
  });

  final String title;
  final List<String> tags;
  final String synopsis;
  final List<MovieReview> reviews;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.72,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onClose ?? () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  color: AppColors.white_primary,
                ),
              ],
            ),
          ),
          // [VN] Tags meta
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags
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
                            color: AppColors.white_primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              children: [
                Text(
                  synopsis,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  TrKeys.dramaReviews.tr,
                  style: const TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...reviews.map((review) => _ReviewTile(review: review)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review});

  final MovieReview review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.gray_800,
                backgroundImage: review.avatarUrl.isNotEmpty
                    ? NetworkImage(review.avatarUrl)
                    : null,
                child: review.avatarUrl.isEmpty
                    ? const Icon(Icons.person, size: 14, color: AppColors.white_primary)
                    : null,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  review.userName,
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
                  style: const TextStyle(
                    color: AppColors.gray_600,
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            style: const TextStyle(
              color: AppColors.white_primary,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
