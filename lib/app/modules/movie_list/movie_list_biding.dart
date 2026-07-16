import 'package:get/get.dart';
import 'package:wetv/app/modules/movie_list/movie_list_controller.dart';

class MovieListBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieListController());
  }
}
