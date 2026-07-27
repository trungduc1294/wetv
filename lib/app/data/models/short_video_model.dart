// [VN] Model một short video trong feed For You
class ShortVideoModel {
  const ShortVideoModel({
    required this.id,
    required this.coverUrl,
    required this.title,
    this.thumbnailUrl = '',
    this.genre = '',
    this.description = '',
    this.subtitlePrimary = '',
    this.subtitleSecondary = '',
    this.seriesLabel = '',
    this.ratingLabel = 'T13',
    this.likeCount = 0,
    this.progress = 0.3,
  });

  final String id;
  // [VN] Ảnh cover dùng làm placeholder video (chưa gắn video_player)
  final String coverUrl;
  final String title;
  final String thumbnailUrl;
  final String genre;
  final String description;
  final String subtitlePrimary;
  final String subtitleSecondary;
  final String seriesLabel;
  final String ratingLabel;
  final int likeCount;
  // [VN] Tiến độ phát 0.0 - 1.0
  final double progress;
}
