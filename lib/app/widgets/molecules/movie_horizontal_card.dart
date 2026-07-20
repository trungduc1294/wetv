import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_model.dart';

// [VN] Card phim dạng ngang: poster ngang + tên + mô tả ngắn
class MovieHorizontalCard extends StatelessWidget {
  const MovieHorizontalCard({
    super.key,
    required this.movie,
    required this.onTap,
    this.width = 164,
    this.height = 106,
    this.imageRadius = 10,
    this.movieNameStyle = const TextStyle(color: AppColors.white_primary),
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
    this.descriptionMaxLines = 1,
    this.descriptionOverflow = TextOverflow.ellipsis,
    this.shortDescriptionStyle = const TextStyle(color: AppColors.gray_600),
  });

  final MovieModel movie;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double imageRadius;
  final TextStyle movieNameStyle;
  final int maxLines;
  final TextOverflow overflow;
  final int descriptionMaxLines;
  final TextOverflow descriptionOverflow;
  final TextStyle shortDescriptionStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [VN] Poster ngang bo góc
          ClipRRect(
            borderRadius: BorderRadius.circular(imageRadius),
            child: Image.network(
              movie.posterUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          // [VN] Tên phim
          SizedBox(
            width: width,
            child: Text(
              movie.movieName,
              style: movieNameStyle,
              maxLines: maxLines,
              overflow: overflow,
            ),
          ),
          // [VN] Mô tả ngắn nếu có
          if (movie.shortDescription.isNotEmpty) ...[
            const SizedBox(height: 6),
            SizedBox(
              width: width,
              child: Text(
                movie.shortDescription,
                style: shortDescriptionStyle,
                maxLines: descriptionMaxLines,
                overflow: descriptionOverflow,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
