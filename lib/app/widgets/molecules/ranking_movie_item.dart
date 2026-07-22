import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/ranking_movie_model.dart';

// [VN] Item phim trong bảng xếp hạng: số thứ hạng + poster + thông tin
class RankingMovieItem extends StatelessWidget {
  const RankingMovieItem({
    super.key,
    required this.movie,
    required this.rank,
    required this.onTap,
    this.posterWidth = 72,
    this.posterHeight = 108,
    this.imageRadius = 8,
    this.topRankCount = 3,
  });

  final RankingMovieModel movie;
  // [VN] Số thứ hạng (bắt đầu từ 1)
  final int rank;
  final VoidCallback onTap;
  final double posterWidth;
  final double posterHeight;
  final double imageRadius;
  // [VN] Số item đầu có màu cam; còn lại màu gray
  final int topRankCount;

  @override
  Widget build(BuildContext context) {
    // [VN] 3 hạng đầu màu cam, còn lại gray
    final rankColor =
        rank <= topRankCount ? AppColors.orange_primary : AppColors.gray_700;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // [VN] Số xếp hạng ~1/2 chiều cao poster
            SizedBox(
              width: 36,
              child: Text(
                '$rank',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: rankColor,
                  fontSize: posterHeight * 0.45,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // [VN] Poster đứng
            ClipRRect(
              borderRadius: BorderRadius.circular(imageRadius),
              child: Image.network(
                movie.posterUrl,
                width: posterWidth,
                height: posterHeight,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // [VN] Thông tin phim bên phải poster
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // [VN] Năm + genre tag
                  Row(
                    children: [
                      if (movie.year.isNotEmpty)
                        Text(
                          movie.year,
                          style: const TextStyle(
                            color: AppColors.gray_600,
                            fontSize: 12,
                          ),
                        ),
                      if (movie.year.isNotEmpty && movie.genre.isNotEmpty)
                        const SizedBox(width: 8),
                      if (movie.genre.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.gray_800,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            movie.genre,
                            style: const TextStyle(
                              color: AppColors.gray_600,
                              fontSize: 11,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (movie.description.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      movie.description,
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
      ),
    );
  }
}
