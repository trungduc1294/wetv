import 'package:flutter/material.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/widgets/molecules/movie_vertical_card.dart';

class MovieHorizontalList extends StatelessWidget {
  const MovieHorizontalList({
    super.key,
    required this.movies,
    required this.onMovieTap,
    this.spacing = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.cardWidth = 104,
    this.cardHeight = 164,
  });

  final List<MovieModel> movies;
  final void Function(MovieModel movie) onMovieTap;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: padding,
      itemCount: movies.length,
      separatorBuilder: (_, __) => SizedBox(width: spacing),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieVerticalCard(
          movie: movie,
          width: cardWidth,
          height: cardHeight,
          onTap: () => onMovieTap(movie),
        );
      },
    );
  }
}
