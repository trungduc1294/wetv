import 'package:get/get.dart';
import 'package:wetv/app/data/models/wallet_models.dart';

// [VN] Controller màn tặng thẻ VIP
class VipGiftCardController extends GetxController {
  final selectedCardIndex = 1.obs;
  final selectedPackageIndex = 0.obs;
  final selectedQuantityIndex = 0.obs;

  final cards = <VipGiftCardOption>[].obs;
  final packages = <VipPackageOption>[].obs;
  final quantities = const [1, 5, 10, 50];

  @override
  void onInit() {
    super.onInit();
    _loadSample();
  }

  void _loadSample() {
    cards.assignAll(const [
      VipGiftCardOption(
        id: '1',
        title: 'The First Jasmine',
        imageUrl: 'https://picsum.photos/seed/vip1/800/450',
        priceLabel: 'Monthly VIP \$7.99',
      ),
      VipGiftCardOption(
        id: '2',
        title: 'Overdo',
        imageUrl: 'https://picsum.photos/seed/vip2/800/450',
        priceLabel: 'Monthly VIP \$7.99',
      ),
      VipGiftCardOption(
        id: '3',
        title: 'Star Path',
        imageUrl: 'https://picsum.photos/seed/vip3/800/450',
        priceLabel: 'Monthly VIP \$7.99',
      ),
    ]);

    packages.assignAll(const [
      VipPackageOption(id: 'p1', label: 'VIP 1 tháng', priceLabel: '\$7.99'),
      VipPackageOption(id: 'p2', label: 'VIP 3 tháng', priceLabel: '\$21.99'),
      VipPackageOption(id: 'p3', label: 'VIP 12 tháng', priceLabel: '\$69.99'),
    ]);
  }

  VipGiftCardOption get selectedCard => cards[selectedCardIndex.value];

  VipPackageOption get selectedPackage => packages[selectedPackageIndex.value];

  int get selectedQuantity => quantities[selectedQuantityIndex.value];

  // [VN] Tổng tiền tạm tính = giá gói (chưa nhân số lượng ở UI mẫu)
  String get totalPriceLabel => selectedPackage.priceLabel;

  void onBack() => Get.back();

  void selectCard(int index) {
    selectedCardIndex.value = index;
  }

  void selectPackage(int index) {
    selectedPackageIndex.value = index;
  }

  void selectQuantity(int index) {
    selectedQuantityIndex.value = index;
  }

  void onRulesTap() {}

  void onPurchasedTap() {}

  void onViewAllTap() {}

  void onConfirmPay() {}
}
