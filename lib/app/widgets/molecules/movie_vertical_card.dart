import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_model.dart';

class MovieVerticalCard extends StatelessWidget {
  const MovieVerticalCard({
    super.key,
    required this.movie,
    required this.onTap,
    this.width = 104,
    this.height = 164,
    this.imageRadius = 10,
    this.movieNameStyle = const TextStyle(color: AppColors.white_primary),
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  });

  final MovieModel movie;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double imageRadius;
  final TextStyle movieNameStyle;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(
            width: width,
            child: Text(
              movie.movieName,
              style: movieNameStyle,
              maxLines: maxLines,
              overflow: overflow,
            ),
          ),
        ],
      ),
    );
  }
}
