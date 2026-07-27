import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';

// [VN] Diễn viên trong phim
class ActorModel {
  const ActorModel({
    required this.id,
    required this.name,
    this.avatarUrl = '',
    this.birthday = '',
    this.gender = '',
    this.zodiac = '',
    this.works = const [],
  });

  final String id;
  final String name;
  final String avatarUrl;
  final String birthday;
  final String gender;
  final String zodiac;
  final List<MovieModel> works;
}

// [VN] Nhân vật trong bảng thả tim / BXH
class CharacterRankModel {
  const CharacterRankModel({
    required this.id,
    required this.name,
    required this.rank,
    this.avatarUrl = '',
    this.heartCount = '',
    this.movieTitle = '',
    this.badge = '',
  });

  final String id;
  final String name;
  final int rank;
  final String avatarUrl;
  final String heartCount;
  final String movieTitle;
  final String badge;
}

// [VN] Dữ liệu đầy đủ màn chi tiết / xem phim
class MovieWatchDetail {
  const MovieWatchDetail({
    required this.id,
    required this.title,
    required this.bannerUrl,
    this.ratingLabel = 'T13',
    this.score = '',
    this.episodeCount = 0,
    this.year = '',
    this.tags = const [],
    this.versionLabel = 'Bản tiếng Anh Original',
    this.synopsis = '',
    this.totalEpisodes = 40,
    this.selectedEpisode = 1,
    this.actors = const [],
    this.recommendations = const [],
    this.sideScenes = const [],
    this.photos = const [],
    this.heartRanks = const [],
    this.characterRanks = const [],
    this.reviews = const [],
  });

  final String id;
  final String title;
  final String bannerUrl;
  final String ratingLabel;
  final String score;
  final int episodeCount;
  final String year;
  final List<String> tags;
  final String versionLabel;
  final String synopsis;
  final int totalEpisodes;
  final int selectedEpisode;
  final List<ActorModel> actors;
  final List<MovieModel> recommendations;
  final List<MovieSideScene> sideScenes;
  final List<String> photos;
  final List<CharacterRankModel> heartRanks;
  final List<CharacterRankModel> characterRanks;
  final List<MovieReview> reviews;
}
