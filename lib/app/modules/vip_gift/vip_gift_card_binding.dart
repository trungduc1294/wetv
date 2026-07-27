import 'package:get/get.dart';
import 'package:wetv/app/modules/vip_gift/vip_gift_card_controller.dart';

// [VN] Binding màn tặng thẻ VIP
class VipGiftCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VipGiftCardController());
  }
}
