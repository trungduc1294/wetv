import 'package:get/get.dart';
import 'package:wetv/app/apis/apis.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';

class MovieListController extends GetxController {
  final MovieListApi _movieListApi = MovieListApi();

  final movieHeroSlides = <MovieHeroSlide>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMovieHeroSlides();
  }

  // [VN] Lấy danh sách movie hero slide từ API
  Future<void> getMovieHeroSlides() async {
    try {
      final result = await _movieListApi.getMovieHeroSlides();
      movieHeroSlides.assignAll(result);
      print(movieHeroSlides);
    } catch (e) {
      print(e);
    }
  }
}
