// [VN] Model phim dùng cho danh sách bảng xếp hạng
class RankingMovieModel {
  const RankingMovieModel({
    required this.id,
    required this.posterUrl,
    required this.title,
    this.year = '',
    this.genre = '',
    this.description = '',
  });

  final String id;
  final String posterUrl;
  final String title;
  final String year;
  final String genre;
  final String description;

  factory RankingMovieModel.fromJson(Map<String, dynamic> json, int index) {
    return RankingMovieModel(
      id: '$index',
      posterUrl: json['posterUrl'],
      title: json['title'],
      year: json['year'],
      genre: json['genre'],
      description: json['description'],
    );
  }
}
