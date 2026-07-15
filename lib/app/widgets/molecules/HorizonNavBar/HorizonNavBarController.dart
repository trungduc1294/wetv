import 'package:get/get.dart';

class Horizonnavbarcontroller extends GetxController {
  // [VN] Biến observable lưu trữ index của tab đang chọn
  var selectedIndex = 0.obs;

  // [VN] Danh sách các item trên Nav
  final List<String> navItems = ['Nổi bật', 'Phim truyện', 'Anime', 'Cổ trang'];

  // [VN] Hàm thay đôi tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
