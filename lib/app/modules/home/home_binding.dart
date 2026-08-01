import 'package:get/instance_manager.dart';
import 'package:wetv/app/modules/home/home_controller.dart';
import 'package:wetv/app/modules/movie_list/movie_list_controller.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/horizon_nav_bar_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Homecontroller());
    Get.lazyPut(() => Horizonnavbarcontroller());
    Get.lazyPut(() => MovieListController());
  }
}
