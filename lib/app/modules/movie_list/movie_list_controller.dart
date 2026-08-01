import 'package:get/get.dart';
import 'package:wetv/app/apis/apis.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';
import 'package:wetv/app/data/models/movie_model.dart';

class MovieListController extends GetxController {
  final MovieListApi _movieListApi = MovieListApi();

  final selectedCategoryId = 1.obs;
  final movieHeroSlides = <MovieHeroSlide>[].obs;
  final movieList = <MovieModel>[].obs;
  final movieListDetailInfo = <MovieDetailInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadByCategory(selectedCategoryId.value);
  }

  // [VN] Gọi API lấy toàn bộ dữ liệu theo category
  Future<void> loadByCategory(int categoryId) async {
    selectedCategoryId.value = categoryId;

    await Future.wait([
      getMovieHeroSlides(categoryId),
      getMovieList(categoryId),
      getMovieListDetailInfo(categoryId),
    ]);
  }

  Future<void> getMovieHeroSlides(int categoryId) async {
    try {
      final result = await _movieListApi.getMovieHeroSlides(
        categoryId: categoryId,
      );
      movieHeroSlides.assignAll(result);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMovieList(int categoryId) async {
    try {
      final result = await _movieListApi.getMovieList(categoryId: categoryId);
      movieList.assignAll(result);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMovieListDetailInfo(int categoryId) async {
    try {
      final result = await _movieListApi.getMovieListDetailInfo(
        categoryId: categoryId,
      );
      movieListDetailInfo.assignAll(result);
    } catch (e) {
      print(e);
    }
  }
}
