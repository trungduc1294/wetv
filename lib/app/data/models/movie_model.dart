class MovieModel {
  final String id;
  final String posterUrl;
  final String movieName;

  MovieModel({
    required this.id,
    required this.posterUrl,
    required this.movieName,
  });

  // [VN] Tạo factory method từ JSON
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      posterUrl: json['posterUrl'],
      movieName: json['movieName'],
    );
  }

  // [VN] Tạo method toJson để chuyển đổi thành JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'posterUrl': posterUrl, 'movieName': movieName};
  }
}
