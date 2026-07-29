// [VN] Tag gắn với phim (viền hoặc nền đặc)
class MovieTag {
  const MovieTag({required this.label, this.filled = false});

  final String label;
  // [VN] true = nền cam đặc, false = chỉ viền cam
  final bool filled;

  // [VN] Hỗ trợ cả string thuần lẫn object {label, filled}
  factory MovieTag.fromJson(dynamic json) {
    if (json is String) {
      return MovieTag(label: json);
    }
    final map = json as Map<String, dynamic>;
    return MovieTag(
      label: map['label'] as String,
      filled: (map['filled'] as bool?) ?? false,
    );
  }
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

  factory MovieReview.fromJson(Map<String, dynamic> json) {
    return MovieReview(
      userName: json['userName'] as String,
      comment: json['comment'] as String,
      avatarUrl: (json['avatarUrl'] as String?) ?? '',
      date: (json['date'] as String?) ?? '',
    );
  }
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

  // [VN] id lấy từ JSON hoặc fallback theo index
  factory MovieSideScene.fromJson(Map<String, dynamic> json, int index) {
    return MovieSideScene(
      id: json['id']?.toString() ?? '$index',
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      duration: (json['duration'] as String?) ?? '',
    );
  }
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

  factory MovieDetailInfo.fromJson(Map<String, dynamic> json) {
    final tagsJson = json['tags'] as List<dynamic>? ?? const [];
    final featuredImagesJson =
        json['featuredImages'] as List<dynamic>? ?? const [];
    final reviewsJson = json['reviews'] as List<dynamic>? ?? const [];
    final sideScenesJson = json['sideScenes'] as List<dynamic>? ?? const [];

    return MovieDetailInfo(
      posterUrl: json['posterUrl'] as String,
      title: json['title'] as String,
      tags: tagsJson.map(MovieTag.fromJson).toList(),
      shortDescription: (json['shortDescription'] as String?) ?? '',
      featuredImages: featuredImagesJson.map((e) => e as String).toList(),
      reviews: reviewsJson
          .map((e) => MovieReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: (json['summary'] as String?) ?? '',
      sideScenes: sideScenesJson
          .asMap()
          .entries
          .map(
            (e) => MovieSideScene.fromJson(
              e.value as Map<String, dynamic>,
              e.key,
            ),
          )
          .toList(),
    );
  }
}
