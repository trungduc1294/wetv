import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/top_search_item_model.dart';

// [VN] Item hàng trong danh sách tìm kiếm hàng đầu
class TopSearchListItem extends StatelessWidget {
  const TopSearchListItem({
    super.key,
    required this.item,
    required this.rank,
    this.onTap,
    this.thumbnailWidth = 120,
    this.thumbnailHeight = 68,
  });

  final TopSearchItemModel item;
  final int rank;
  final VoidCallback? onTap;
  final double thumbnailWidth;
  final double thumbnailHeight;

  @override
  Widget build(BuildContext context) {
    final isTopThree = rank <= 3;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [VN] Thumbnail ngang + badge xếp hạng góc trên trái
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: thumbnailWidth,
                height: thumbnailHeight,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        item.thumbnailUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: AppColors.gray_800,
                          child: const Icon(
                            Icons.image,
                            color: AppColors.gray_600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 22,
                        height: 22,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isTopThree
                              ? AppColors.orange_primary
                              : Colors.black.withValues(alpha: 0.7),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          '$rank',
                          style: const TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (item.meta.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.meta,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.gray_600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                  if (item.tags.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: item.tags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.gray_800,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                tag,
                                style: const TextStyle(
                                  color: AppColors.gray_600,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
