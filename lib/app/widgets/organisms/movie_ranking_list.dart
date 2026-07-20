import 'package:flutter/material.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/widgets/molecules/movie_ranking_card.dart';

// [VN] Danh sách ngang các phim trong bảng xếp hạng
class MovieRankingList extends StatelessWidget {
  const MovieRankingList({
    super.key,
    required this.movies,
    required this.onMovieTap,
    this.maxRankingItems,
    this.spacing = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.cardWidth = 104,
    this.cardHeight = 164,
    this.height = 220,
  });

  final List<MovieModel> movies;
  final void Function(MovieModel movie) onMovieTap;
  // [VN] Giới hạn số item hiển thị trong bảng xếp hạng
  final int? maxRankingItems;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final double cardWidth;
  final double cardHeight;
  final double height;

  @override
  Widget build(BuildContext context) {
    // [VN] Cắt danh sách theo maxRankingItems nếu có
    final displayMovies = maxRankingItems != null
        ? movies.take(maxRankingItems!).toList()
        : movies;

    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: displayMovies.length,
        separatorBuilder: (_, _) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          final movie = displayMovies[index];
          // [VN] Thứ hạng bắt đầu từ 1
          final rank = index + 1;
          return MovieRankingCard(
            movie: movie,
            rank: rank,
            width: cardWidth,
            height: cardHeight,
            onTap: () => onMovieTap(movie),
          );
        },
      ),
    );
  }
}
