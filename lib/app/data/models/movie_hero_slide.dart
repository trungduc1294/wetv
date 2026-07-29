// [VN] Một item trong hero slider: foreground PNG + background + title
class MovieHeroSlide {
  const MovieHeroSlide({
    required this.title,
    required this.foregroundUrl,
    required this.backgroundUrl,
  });

  final String title;
  // [VN] Ảnh PNG chủ thể (layer trên, có thể trong suốt)
  final String foregroundUrl;
  // [VN] Ảnh nền phía sau, chuyển bằng fade khi đổi slide
  final String backgroundUrl;

  factory MovieHeroSlide.fromJson(Map<String, dynamic> json) {
    return MovieHeroSlide(
      title: json['title'],
      foregroundUrl: json['foregroundUrl'],
      backgroundUrl: json['backgroundUrl'],
    );
  }
}
