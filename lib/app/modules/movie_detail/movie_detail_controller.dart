import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';

// [VN] Controller màn chi tiết / xem phim
class MovieDetailController extends GetxController {
  final selectedTabIndex = 0.obs;
  final selectedEpisode = 1.obs;

  late final MovieWatchDetail detail;

  // [VN] Tab label cố định — i18n
  List<MovieDetailTabLabel> get tabs => [
        MovieDetailTabLabel(label: TrKeys.detail.tr),
        MovieDetailTabLabel(label: TrKeys.sideScenes.tr, showPlayIcon: true),
        MovieDetailTabLabel(label: TrKeys.beautifulPhotos.tr),
        MovieDetailTabLabel(label: TrKeys.heartTab.tr),
        MovieDetailTabLabel(label: TrKeys.characterRankTab.tr),
      ];

  @override
  void onInit() {
    super.onInit();
    detail = _sampleDetail();
    selectedEpisode.value = detail.selectedEpisode;
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void selectEpisode(int episode) {
    selectedEpisode.value = episode;
  }

  void onBack() => Get.back();

  void onCast() {}

  void onAdd() {}

  void onDownload() {}

  void onShare() {}

  void onLike() {}

  void onSendHeart(CharacterRankModel character) {}

  void onSendLove(CharacterRankModel character) {}

  void onSideSceneTap(MovieSideScene scene) {}

  void onRecommendTap(MovieModel movie) {}

  void onWorkTap(MovieModel movie) {}

  // [VN] Dữ liệu mẫu preview UI
  MovieWatchDetail _sampleDetail() {
    const poster =
        'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350';
    const banner = 'https://picsum.photos/seed/movie-banner/900/500';
    const avatar = 'https://i.pravatar.cc/150?img=';

    final works = [
      MovieModel(id: 'w1', posterUrl: poster, movieName: 'Cẩm Tú An Ninh'),
      MovieModel(id: 'w2', posterUrl: poster, movieName: 'Liễu Chu Ký'),
      MovieModel(
        id: 'w3',
        posterUrl: poster,
        movieName: 'Trường Tương Tư 1',
      ),
    ];

    return MovieWatchDetail(
      id: 'md1',
      title: 'Liễu Chu Ký',
      bannerUrl: banner,
      ratingLabel: 'T13',
      score: '9.2',
      episodeCount: 40,
      year: '2024',
      tags: const ['Tình yêu', 'Phục trang cổ đại', 'T13'],
      versionLabel: 'Bản tiếng Anh Original',
      synopsis:
          'Bộ phim kể về hành trình của Liễu Miên Đường giữa những âm mưu cung đình và tình cảm phức tạp. '
          'Cô phải đối mặt với thử thách để bảo vệ người thân và tìm lại chính mình. '
          'Song song đó là mối duyên ngang trái với những nhân vật mang số phận đan xen.',
      totalEpisodes: 40,
      selectedEpisode: 1,
      actors: [
        ActorModel(
          id: 'a1',
          name: 'Trương Vãn Ý',
          avatarUrl: '${avatar}5',
          birthday: '1994-04-22',
          gender: 'nữ giới',
          zodiac: 'Kim Ngưu',
          works: works,
        ),
        ActorModel(
          id: 'a2',
          name: 'Vương Sở Nhiên',
          avatarUrl: '${avatar}12',
          birthday: '1991-01-05',
          gender: 'nam giới',
          zodiac: 'Ma Kết',
          works: works,
        ),
        ActorModel(
          id: 'a3',
          name: 'Lưu Lệnh Tư',
          avatarUrl: '${avatar}32',
          birthday: '1995-08-10',
          gender: 'nữ giới',
          zodiac: 'Sư Tử',
          works: works,
        ),
      ],
      recommendations: [
        MovieModel(id: 'r1', posterUrl: poster, movieName: 'Lương Thần Mỹ Cảnh'),
        MovieModel(
          id: 'r2',
          posterUrl: poster,
          movieName: 'Liễu Chu Ký (English Version)',
        ),
      ],
      sideScenes: List.generate(
        6,
        (i) => MovieSideScene(
          id: 's$i',
          thumbnailUrl: 'https://picsum.photos/seed/scene$i/400/240',
          title:
              'Hậu trường độc quyền tập ${i + 1} | Liễu Chu Ký behind the scenes...',
          duration: '0${i + 1}:25',
        ),
      ),
      photos: List.generate(
        5,
        (i) => 'https://picsum.photos/seed/photo$i/800/500',
      ),
      heartRanks: [
        const CharacterRankModel(
          id: 'h1',
          name: 'Liu Mian Tang',
          rank: 1,
          avatarUrl: 'https://i.pravatar.cc/150?img=47',
          heartCount: '101.9k',
        ),
        const CharacterRankModel(
          id: 'h2',
          name: 'Cui Xing Zhou',
          rank: 2,
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
          heartCount: '49.1k',
        ),
        const CharacterRankModel(
          id: 'h3',
          name: 'Zhao Quan',
          rank: 3,
          avatarUrl: 'https://i.pravatar.cc/150?img=33',
          heartCount: '1.1k',
        ),
        const CharacterRankModel(
          id: 'h4',
          name: 'Shi Xue Ji',
          rank: 4,
          avatarUrl: 'https://i.pravatar.cc/150?img=20',
          heartCount: '890',
        ),
        const CharacterRankModel(
          id: 'h5',
          name: 'Liu Yu',
          rank: 5,
          avatarUrl: 'https://i.pravatar.cc/150?img=25',
          heartCount: '633',
        ),
        const CharacterRankModel(
          id: 'h6',
          name: 'He Zhen',
          rank: 6,
          avatarUrl: 'https://i.pravatar.cc/150?img=28',
          heartCount: '510',
        ),
      ],
      characterRanks: [
        const CharacterRankModel(
          id: 'c1',
          name: 'Ye Li',
          rank: 1,
          avatarUrl: 'https://i.pravatar.cc/150?img=47',
          heartCount: '890.2K',
          movieTitle: 'Liễu Chu Ký',
          badge: '2026/06 TOP1',
        ),
        const CharacterRankModel(
          id: 'c2',
          name: 'Soh',
          rank: 2,
          avatarUrl: 'https://i.pravatar.cc/150?img=15',
          heartCount: '640.9K',
          movieTitle: 'Be My Player Two...',
          badge: 'Số 5 BXH của năm',
        ),
        const CharacterRankModel(
          id: 'c3',
          name: 'Three',
          rank: 3,
          avatarUrl: 'https://i.pravatar.cc/150?img=18',
          heartCount: '320.1K',
          movieTitle: 'Love of Silom',
          badge: 'Số 8 BXH của năm',
        ),
        const CharacterRankModel(
          id: 'c4',
          name: 'WAYU',
          rank: 4,
          avatarUrl: 'https://i.pravatar.cc/150?img=22',
          heartCount: '210.4K',
          movieTitle: 'Love of Silom',
          badge: 'Số 12 BXH của năm',
        ),
        const CharacterRankModel(
          id: 'c5',
          name: 'Nova',
          rank: 5,
          avatarUrl: 'https://i.pravatar.cc/150?img=30',
          heartCount: '180.0K',
          movieTitle: 'Star Path',
          badge: 'Số 15 BXH của năm',
        ),
      ],
      reviews: const [
        MovieReview(
          userName: 'Hema Lehmann',
          date: '2024-08-12 02:59:22',
          comment:
              'Phim hay quá, diễn xuất tự nhiên và tạo hình đẹp. Xem mà cười suốt 😆',
          avatarUrl: 'https://i.pravatar.cc/150?img=1',
        ),
        MovieReview(
          userName: 'Kian Kovacs',
          date: '2024-08-11 18:20:10',
          comment:
              'Cốt truyện cuốn, nhạc nền hay. Recommend mọi người xem hết tập!',
          avatarUrl: 'https://i.pravatar.cc/150?img=8',
        ),
      ],
    );
  }
}

// [VN] Label tab dùng trong controller
class MovieDetailTabLabel {
  const MovieDetailTabLabel({
    required this.label,
    this.showPlayIcon = false,
  });

  final String label;
  final bool showPlayIcon;
}
