import 'package:get/get.dart';
import 'package:wetv/app/modules/movie_detail/movie_detail_controller.dart';

// [VN] Binding màn chi tiết phim
class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
}
