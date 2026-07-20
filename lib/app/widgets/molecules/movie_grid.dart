import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_model.dart';

// [VN] Lưới hiển thị danh sách phim theo cột cố định
class MovieGrid extends StatelessWidget {
  const MovieGrid({
    super.key,
    required this.movies,
    required this.onMovieTap,
    this.showTitle = true,
    this.crossAxisCount = 2,
    this.spacing = 10,
    this.spacingY,
    this.titleSpacing = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.imageAspectRatio = 16 / 10,
    this.imageRadius = 10,
    this.movieNameStyle = const TextStyle(color: AppColors.white_primary),
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.shrinkWrap = false,
    this.physics,
  });

  final List<MovieModel> movies;
  final void Function(MovieModel movie) onMovieTap;
  // [VN] Bật/tắt hiển thị tên phim dưới poster
  final bool showTitle;
  final int crossAxisCount;
  // [VN] Khoảng cách ngang giữa các item
  final double spacing;
  // [VN] Khoảng cách dọc khi có title; nếu null thì dùng spacing
  final double? spacingY;
  // [VN] Khoảng cách giữa poster và tên phim
  final double titleSpacing;
  final EdgeInsetsGeometry padding;
  final double imageAspectRatio;
  final double imageRadius;
  final TextStyle movieNameStyle;
  final int maxLines;
  final TextOverflow overflow;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  // [VN] Khi không có title thì gap X và Y bằng nhau
  double get _mainAxisSpacing =>
      showTitle ? (spacingY ?? spacing) : spacing;

  // [VN] Tính chiều cao khối title để set mainAxisExtent cho grid
  double _titleBlockHeight(BuildContext context) {
    if (!showTitle) return 0;
    final style = DefaultTextStyle.of(context).style.merge(movieNameStyle);
    final painter = TextPainter(
      text: TextSpan(text: 'Ag', style: style),
      maxLines: maxLines,
      textDirection: Directionality.of(context),
    )..layout();
    return titleSpacing + painter.height * maxLines;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final resolvedPadding = padding.resolve(Directionality.of(context));
        final availableWidth =
            constraints.maxWidth -
            resolvedPadding.left -
            resolvedPadding.right;
        final itemWidth =
            (availableWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;
        final imageHeight = itemWidth / imageAspectRatio;
        final mainAxisExtent = imageHeight + _titleBlockHeight(context);

        return GridView.builder(
          padding: padding,
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: _mainAxisSpacing,
            mainAxisExtent: mainAxisExtent,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieGridItem(
              movie: movie,
              showTitle: showTitle,
              titleSpacing: titleSpacing,
              imageRadius: imageRadius,
              movieNameStyle: movieNameStyle,
              maxLines: maxLines,
              overflow: overflow,
              onTap: () => onMovieTap(movie),
            );
          },
        );
      },
    );
  }
}

// [VN] Một ô trong grid: poster + tên phim (tuỳ chọn)
class _MovieGridItem extends StatelessWidget {
  const _MovieGridItem({
    required this.movie,
    required this.showTitle,
    required this.titleSpacing,
    required this.imageRadius,
    required this.movieNameStyle,
    required this.maxLines,
    required this.overflow,
    required this.onTap,
  });

  final MovieModel movie;
  final bool showTitle;
  final double titleSpacing;
  final double imageRadius;
  final TextStyle movieNameStyle;
  final int maxLines;
  final TextOverflow overflow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [VN] Poster chiếm phần còn lại của ô grid
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(imageRadius),
              child: Image.network(
                movie.posterUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showTitle) ...[
            SizedBox(height: titleSpacing),
            Text(
              movie.movieName,
              style: movieNameStyle,
              maxLines: maxLines,
              overflow: overflow,
            ),
          ],
        ],
      ),
    );
  }
}
