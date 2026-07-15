import 'package:get/get.dart';
import 'package:wetv/app/apis/apis.dart';
import 'package:wetv/app/data/models/category_model.dart';

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

  // [VN] Hàm thay đổi tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
