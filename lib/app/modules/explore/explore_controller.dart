import 'package:get/get.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/ranking_movie_model.dart';
import 'package:wetv/app/routes/app_routes.dart';
import 'package:wetv/app/widgets/organisms/explore_filter_groups.dart';

// [VN] Controller tab Khám phá
class ExploreController extends GetxController {
  // [VN] 0 = BXH, 1 = Lọc
  final mainTabIndex = 0.obs;

  // [VN] Trạng thái mở/đóng dropdown filter BXH
  final dropdownExpanded = false.obs;
  final dropdownSelectedIndex = 0.obs;
  final rankingChipIndex = 1.obs;

  // [VN] Index selected theo từng nhóm filter tab Lọc
  final filterSelectedIndexes = <int>[0, 1, 0, 0, 0, 0, 0].obs;

  final dropdownOptions = const [
    'Trọn bộ',
    'Phim truyền hình',
    'Phim điện ảnh',
    'Phim ngắn',
    'Chương trình giải trí',
    'Anime',
    'Thiếu nhi',
    'Hồng hoa',
  ];

  final rankingChipLabels = const [
    'Đang hot tại Việt Nam',
    'Tìm kiếm hot nhất',
    'BXH tuần',
  ];

  final filterGroupOptions = const [
    ['Hot nhất', 'Mới nhất', 'Đánh giá'],
    ['Trọn bộ', 'Phim truyền hình', 'Phim điện ảnh', 'Anime'],
    ['Trọn bộ', 'Phim ngắn'],
    ['Trọn bộ', 'Phim truyện', 'Lãng mạn', 'Kỳ ảo', 'Cổ trang'],
    ['Trọn bộ', 'Trung Quốc', 'Hàn Quốc', 'Thái Lan', 'Nhật Bản'],
    ['Trọn bộ', 'VIP', 'Miễn phí'],
    ['Trọn bộ', '2026', '2025', '2024', '2023', '2022'],
  ];

  final rankingMovies = <RankingMovieModel>[].obs;
  final filterMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSampleData();
  }

  // [VN] Dữ liệu mẫu để preview UI
  void _loadSampleData() {
    const poster =
        'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350';

    rankingMovies.assignAll([
      const RankingMovieModel(
        id: '1',
        posterUrl: poster,
        title: 'Bách Hoa Sát',
        year: '2026',
        genre: 'Phục trang cổ đại',
        description: 'Câu chuyện cổ trang ly kỳ về tình yêu và thù hận...',
      ),
      const RankingMovieModel(
        id: '2',
        posterUrl: poster,
        title: 'Cô Nàng Mạnh Mẽ Bong-Soon',
        year: '2017',
        genre: 'Tình tiết',
        description: 'Cô gái có sức mạnh siêu nhiên bảo vệ người mình yêu...',
      ),
      const RankingMovieModel(
        id: '3',
        posterUrl: poster,
        title: 'Mạc Ly',
        year: '2026',
        genre: 'Lãng mạn',
        description: 'Hành trình tìm lại chính mình giữa cuộc sống hiện đại...',
      ),
      const RankingMovieModel(
        id: '4',
        posterUrl: poster,
        title: 'Tinh Hà Xán Lạn',
        year: '2025',
        genre: 'Cổ trang',
        description: 'Ngôi sao sáng giữa bầu trời đêm đầy biến động...',
      ),
      const RankingMovieModel(
        id: '5',
        posterUrl: poster,
        title: 'Tình Yêu Có Pháo Hoa',
        year: '2024',
        genre: 'Tình cảm',
        description: 'Tình yêu ngọt ngào như những đêm pháo hoa rực rỡ...',
      ),
      const RankingMovieModel(
        id: '6',
        posterUrl: poster,
        title: 'Trục Ngọc',
        year: '2026',
        genre: 'Kỳ ảo',
        description: 'Cuộc chiến bảo vệ viên ngọc thần giữa hai thế giới...',
      ),
    ]);

    filterMovies.assignAll([
      MovieModel(id: '1', posterUrl: poster, movieName: 'Bách Hoa Sát'),
      MovieModel(
        id: '2',
        posterUrl: poster,
        movieName: 'Giây Phút Vượt Quá Giới Hạn',
      ),
      MovieModel(id: '3', posterUrl: poster, movieName: 'Mạc Ly'),
      MovieModel(id: '4', posterUrl: poster, movieName: 'Tinh Hà Xán Lạn'),
      MovieModel(id: '5', posterUrl: poster, movieName: 'Tình Yêu Có Pháo Hoa'),
      MovieModel(id: '6', posterUrl: poster, movieName: 'Trục Ngọc'),
    ]);
  }

  // [VN] Chuyển tab BXH / Lọc
  void changeMainTab(int index) {
    mainTabIndex.value = index;
    dropdownExpanded.value = false;
  }

  // [VN] Mở/đóng dropdown filter
  void toggleDropdown() {
    dropdownExpanded.value = !dropdownExpanded.value;
  }

  // [VN] Chọn option trong dropdown — tạm thời chưa fetch
  void selectDropdownOption(int index) {
    dropdownSelectedIndex.value = index;
    dropdownExpanded.value = false;
    fetchRankingData();
  }

  // [VN] Chọn chip filter trên thanh BXH — tạm thời chưa fetch
  void selectRankingChip(int index) {
    rankingChipIndex.value = index;
    fetchRankingData();
  }

  // [VN] Chọn chip trong nhóm filter tab Lọc — tạm thời chưa fetch
  void selectFilterChip(int groupIndex, int chipIndex) {
    filterSelectedIndexes[groupIndex] = chipIndex;
    filterSelectedIndexes.refresh();
    fetchFilterData();
  }

  // [VN] Fetch data bảng xếp hạng — tạm để trống
  void fetchRankingData() {}

  // [VN] Fetch data theo filter — tạm để trống
  void fetchFilterData() {}

  // [VN] Navigate search — tạm để trống
  void onSearchTap() {}

  // [VN] Click item ranking — mở màn chi tiết
  void onRankingMovieTap(RankingMovieModel movie, int rank) {
    Get.toNamed(AppRoutes.MOVIE_DETAIL);
  }

  // [VN] Click item grid filter — mở màn chi tiết
  void onFilterMovieTap(MovieModel movie) {
    Get.toNamed(AppRoutes.MOVIE_DETAIL);
  }

  // [VN] Build danh sách FilterChipGroup từ state hiện tại
  List<FilterChipGroup> get filterGroups {
    return List.generate(filterGroupOptions.length, (i) {
      return FilterChipGroup(
        options: filterGroupOptions[i],
        selectedIndex: filterSelectedIndexes[i],
      );
    });
  }

  // [VN] Label hiện trên nút dropdown
  String get dropdownLabel => dropdownOptions[dropdownSelectedIndex.value];
}
