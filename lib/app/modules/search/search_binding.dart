import 'package:get/get.dart';
import 'package:wetv/app/modules/search/search_controller.dart';

// [VN] Binding màn Search
class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchPageController());
  }
}
