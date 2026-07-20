import 'package:get/get.dart';

class Homecontroller extends GetxController {
  // [VN] Index tab BottomNavigationBar đang chọn
  final selectedIndex = 0.obs;

  // [VN] Đổi tab bottom navigation
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
