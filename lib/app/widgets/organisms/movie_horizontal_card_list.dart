import 'package:flutter/material.dart';
import 'package:wetv/app/widgets/molecules/movie_horizontal_card.dart';
import 'package:wetv/app/data/models/movie_model.dart';

class MovieHorizontalCardList extends StatelessWidget {
  const MovieHorizontalCardList({
    super.key,
    required this.movies,
    required this.onMovieTap,
    this.spacing = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.cardWidth = 164,
    this.cardHeight = 106,
    this.height = 200,
  });

  final List<MovieModel> movies;
  final void Function(MovieModel movie) onMovieTap;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final double cardWidth;
  final double cardHeight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: movies.length,
        separatorBuilder: (_, _) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieHorizontalCard(
            movie: movie,
            width: cardWidth,
            height: cardHeight,
            onTap: () => onMovieTap(movie),
          );
        },
      ),
    );
  }
}
