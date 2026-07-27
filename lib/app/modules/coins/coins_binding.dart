import 'package:get/get.dart';
import 'package:wetv/app/modules/coins/coins_controller.dart';

// [VN] Binding màn Coins
class CoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoinsController());
  }
}
