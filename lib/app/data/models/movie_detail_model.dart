// [VN] Tag gắn với phim (viền hoặc nền đặc)
class MovieTag {
  const MovieTag({
    required this.label,
    this.filled = false,
  });

  final String label;
  // [VN] true = nền cam đặc, false = chỉ viền cam
  final bool filled;
}

// [VN] Đánh giá của người dùng về phim
class MovieReview {
  const MovieReview({
    required this.userName,
    required this.comment,
    this.avatarUrl = '',
    this.date = '',
  });

  final String userName;
  final String comment;
  final String avatarUrl;
  final String date;
}

// [VN] Một cảnh bên lề / đoạn phim độc quyền
class MovieSideScene {
  const MovieSideScene({
    required this.id,
    required this.thumbnailUrl,
    required this.title,
    this.duration = '',
  });

  final String id;
  final String thumbnailUrl;
  final String title;
  final String duration;
}

// [VN] Model tổng hợp dữ liệu chi tiết phim cho panel scroll ngang
class MovieDetailInfo {
  const MovieDetailInfo({
    required this.posterUrl,
    required this.title,
    this.tags = const [],
    this.shortDescription = '',
    this.featuredImages = const [],
    this.reviews = const [],
    this.summary = '',
    this.sideScenes = const [],
  });

  final String posterUrl;
  final String title;
  final List<MovieTag> tags;
  final String shortDescription;
  // [VN] Danh sách URL ảnh cho slider "Ảnh Đẹp"
  final List<String> featuredImages;
  final List<MovieReview> reviews;
  final String summary;
  final List<MovieSideScene> sideScenes;
}
