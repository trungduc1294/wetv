import 'package:get/get.dart';
import 'package:wetv/app/apis/apis.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';
import 'package:wetv/app/data/models/movie_model.dart';

class MovieListController extends GetxController {
  final MovieListApi _movieListApi = MovieListApi();

  final movieHeroSlides = <MovieHeroSlide>[].obs;
  final movieList = <MovieModel>[].obs;
  final movieListDetailInfo = <MovieDetailInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMovieHeroSlides();
    getMovieList();
    getMovieListDetailInfo();
  }

  // [VN] Lấy danh sách movie hero slide từ API
  Future<void> getMovieHeroSlides() async {
    try {
      final result = await _movieListApi.getMovieHeroSlides();
      movieHeroSlides.assignAll(result);
    } catch (e) {
      print(e);
    }
  }

  // [VN] Lấy danh sách movie list từ API
  Future<void> getMovieList() async {
    try {
      final result = await _movieListApi.getMovieList();
      movieList.assignAll(result);
    } catch (e) {
      print(e);
    }
  }

  // [VN] Lấy thông tin danh sách film chi tiết từ API
  Future<void> getMovieListDetailInfo() async {
    try {
      final result = await _movieListApi.getMovieListDetailInfo();
      movieListDetailInfo.assignAll(result);
      print(movieListDetailInfo);
    } catch (e) {
      print(e);
    }
  }
}
