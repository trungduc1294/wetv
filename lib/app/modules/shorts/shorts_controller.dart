import 'package:get/get.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/short_video_model.dart';

// [VN] Controller màn Shorts
class ShortsController extends GetxController {
  // [VN] 0 = For You, 1 = All
  final mainTabIndex = 0.obs;
  final currentVideoIndex = 0.obs;
  final isPaused = true.obs;
  final selectedChipIndex = 0.obs;

  final chipLabels = const [
    'Trọn bộ',
    'Tổng Tài',
    'Ngược Luyến',
    'Ngọt Sủng',
    'Cổ Trang',
  ];

  final videos = <ShortVideoModel>[].obs;
  final allMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleData();
  }

  // [VN] Dữ liệu mẫu preview UI
  void _loadSampleData() {
    const poster =
        'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350';

    videos.assignAll([
      const ShortVideoModel(
        id: '1',
        coverUrl: 'https://picsum.photos/seed/short1/720/1280',
        thumbnailUrl: poster,
        title: 'Em Không Thể Trốn: Người Vợ Man...',
        genre: 'Tình yêu thành phố',
        description:
            'Một tỷ phú lạnh lùng dần chán ghét người vợ của mình và hết mực cưng chiều bạn gái cũ đang ...',
        subtitlePrimary: 'bà rời Chicago đến Paris khá đột ngột.',
        subtitleSecondary: 'you left Chicago for Paris',
        seriesLabel: 'Xem toàn bộ loạt phim • Trọn bộ 16 tập',
        likeCount: 260,
        progress: 0.35,
      ),
      const ShortVideoModel(
        id: '2',
        coverUrl: 'https://picsum.photos/seed/short2/720/1280',
        thumbnailUrl: poster,
        title: 'Bách Hoa Sát',
        genre: 'Cổ trang',
        description: 'Cuộc chiến giữa các môn phái vì viên ngọc thần bí...',
        subtitlePrimary: 'Ta sẽ không bỏ cuộc.',
        subtitleSecondary: 'I will never give up.',
        seriesLabel: 'Xem toàn bộ loạt phim • Trọn bộ 24 tập',
        likeCount: 1280,
        progress: 0.12,
      ),
      const ShortVideoModel(
        id: '3',
        coverUrl: 'https://picsum.photos/seed/short3/720/1280',
        thumbnailUrl: poster,
        title: 'Mạc Ly',
        genre: 'Lãng mạn',
        description: 'Câu chuyện tình yêu định mệnh giữa họa sĩ và giáo sư...',
        seriesLabel: 'Xem toàn bộ loạt phim • Trọn bộ 20 tập',
        likeCount: 542,
        progress: 0.6,
      ),
    ]);

    allMovies.assignAll([
      MovieModel(
        id: '1',
        posterUrl: poster,
        movieName: 'Bách Hoa Sát',
        shortDescription: 'Tình yêu • Phục trang cổ...',
      ),
      MovieModel(
        id: '2',
        posterUrl: poster,
        movieName: 'Giây Phút Vượt Quá',
        shortDescription: 'Tình yêu • Thành phố',
      ),
      MovieModel(
        id: '3',
        posterUrl: poster,
        movieName: 'Mạc Ly',
        shortDescription: 'Lãng mạn • Hiện đại',
      ),
      MovieModel(
        id: '4',
        posterUrl: poster,
        movieName: 'Tinh Hà Xán Lạn',
        shortDescription: 'Cổ trang • Kỳ ảo',
      ),
      MovieModel(
        id: '5',
        posterUrl: poster,
        movieName: 'Tình Yêu Có Pháo Hoa',
        shortDescription: 'Tình cảm • Ngọt',
      ),
      MovieModel(
        id: '6',
        posterUrl: poster,
        movieName: 'Trục Ngọc',
        shortDescription: 'Kỳ ảo • Phiêu lưu',
      ),
      MovieModel(
        id: '7',
        posterUrl: poster,
        movieName: 'Ngược Luyến',
        shortDescription: 'Tình yêu • Drama',
      ),
      MovieModel(
        id: '8',
        posterUrl: poster,
        movieName: 'Ngọt Sủng',
        shortDescription: 'Tổng tài • Ngọt',
      ),
      MovieModel(
        id: '9',
        posterUrl: poster,
        movieName: 'Cẩm Nguyệt Như Ca',
        shortDescription: 'Cổ trang • Tình cảm',
      ),
    ]);
  }

  // [VN] Đổi tab For You / All
  void changeMainTab(int index) {
    mainTabIndex.value = index;
    if (index == 1) {
      isPaused.value = true;
    }
  }

  // [VN] Đổi page khi lướt short
  void onPageChanged(int index) {
    currentVideoIndex.value = index;
    isPaused.value = false;
  }

  // [VN] Bật/tắt play
  void togglePlay() {
    isPaused.value = !isPaused.value;
  }

  // [VN] Chọn chip filter tab All — fetch tạm trống
  void selectChip(int index) {
    selectedChipIndex.value = index;
    fetchAllMovies();
  }

  void fetchAllMovies() {}

  void onMoreTap() {}

  void onLike() {}

  void onAdd() {}

  void onShare() {}

  void onSeriesTap() {}

  void onMoreDescription() {}

  void onMovieTap(MovieModel movie) {}
}
