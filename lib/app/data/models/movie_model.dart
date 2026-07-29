class MovieModel {
  final String id;
  final String posterUrl;
  final String movieName;
  final String shortDescription;

  MovieModel({
    required this.id,
    required this.posterUrl,
    required this.movieName,
    this.shortDescription = '',
  });

  // [VN] Tạo factory method từ JSON; id lấy từ JSON hoặc fallback theo index
  factory MovieModel.fromJson(Map<String, dynamic> json, int index) {
    return MovieModel(
      id: json['id']?.toString() ?? '$index',
      posterUrl: json['posterUrl'] as String,
      movieName: json['movieName'] as String,
      shortDescription: (json['shortDescription'] as String?) ?? '',
    );
  }

  // [VN] Tạo method toJson để chuyển đổi thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'posterUrl': posterUrl,
      'movieName': movieName,
      'shortDescription': shortDescription,
    };
  }
}
