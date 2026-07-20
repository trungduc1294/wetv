import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_model.dart';

// [VN] Card phim dạng dọc dùng cho bảng xếp hạng, có layer số thứ hạng
class MovieRankingCard extends StatelessWidget {
  const MovieRankingCard({
    super.key,
    required this.movie,
    required this.rank,
    required this.onTap,
    this.width = 104,
    this.height = 164,
    this.imageRadius = 10,
    this.movieNameStyle = const TextStyle(color: AppColors.white_primary),
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
    this.rankFontSize,
    this.rankFillColor = const Color(0x66FFFFFF),
    this.rankStrokeColor = const Color(0xCCFFFFFF),
    this.rankStrokeWidth = 1.5,
  });

  final MovieModel movie;
  // [VN] Số thứ hạng hiển thị trên poster
  final int rank;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double imageRadius;
  final TextStyle movieNameStyle;
  final int maxLines;
  final TextOverflow overflow;
  // [VN] Cỡ chữ số xếp hạng; mặc định ~55% chiều cao poster
  final double? rankFontSize;
  // [VN] Màu fill trong suốt của số xếp hạng
  final Color rankFillColor;
  // [VN] Màu viền của số xếp hạng
  final Color rankStrokeColor;
  final double rankStrokeWidth;

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
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  // [VN] Poster phim
                  Positioned.fill(
                    child: Image.network(
                      movie.posterUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // [VN] Số xếp hạng góc dưới bên phải
                  Positioned(
                    right: -6,
                    bottom: -22,
                    child: _RankNumber(
                      rank: rank,
                      fontSize: rankFontSize ?? height * 0.55,
                      fillColor: rankFillColor,
                      strokeColor: rankStrokeColor,
                      strokeWidth: rankStrokeWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // [VN] Tên phim dưới poster
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

// [VN] Số xếp hạng với hiệu ứng fill trong suốt + viền stroke
class _RankNumber extends StatelessWidget {
  const _RankNumber({
    required this.rank,
    required this.fontSize,
    required this.fillColor,
    required this.strokeColor,
    required this.strokeWidth,
  });

  final int rank;
  final double fontSize;
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      height: 1,
      letterSpacing: -4,
    );

    return Stack(
      children: [
        // [VN] Lớp viền
        Text(
          '$rank',
          style: baseStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        // [VN] Lớp fill trong suốt
        Text(
          '$rank',
          style: baseStyle.copyWith(color: fillColor),
        ),
      ],
    );
  }
}
