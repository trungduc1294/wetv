import 'package:flutter/material.dart';
import 'package:wetv/app/data/models/ranking_movie_model.dart';
import 'package:wetv/app/widgets/molecules/ranking_movie_item.dart';

// [VN] Danh sách dọc bảng xếp hạng phim
class RankingMovieList extends StatelessWidget {
  const RankingMovieList({
    super.key,
    required this.movies,
    required this.onMovieTap,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = false,
    this.physics,
  });

  final List<RankingMovieModel> movies;
  final void Function(RankingMovieModel movie, int rank) onMovieTap;
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        // [VN] Index bắt đầu từ 0 → rank = index + 1
        final rank = index + 1;
        return RankingMovieItem(
          movie: movie,
          rank: rank,
          onTap: () => onMovieTap(movie, rank),
        );
      },
    );
  }
}
