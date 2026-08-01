import 'package:get/get.dart';
import 'package:wetv/app/apis/apis.dart';
import 'package:wetv/app/data/models/category_model.dart';
import 'package:wetv/app/modules/home/home_controller.dart';
import 'package:wetv/app/modules/movie_list/movie_list_controller.dart';

class Horizonnavbarcontroller extends GetxController {
  final CategoriesApi _categoriesApi = CategoriesApi();

  // [VN] Biến observable lưu trữ index của tab đang chọn
  var selectedIndex = 0.obs;

  // [VN] Danh sách category từ API
  final categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  // [VN] Lấy danh sách category từ API
  Future<void> getCategories() async {
    try {
      final result = await _categoriesApi.getCategories();
      categories.assignAll(result);
    } catch (e) {
      print(e);
    }
  }

  // [VN] Đổi tab category -> gọi API load dữ liệu movie list
  void changeTab(int index) {
    if (selectedIndex.value == index) return;
    selectedIndex.value = index;

    if (categories.isEmpty || index >= categories.length) return;

    final categoryId = categories[index].id;
    Get.find<MovieListController>().loadByCategory(categoryId);

    if (Get.isRegistered<Homecontroller>()) {
      Get.find<Homecontroller>().updateScrollOffset(0);
    }
  }
}
