import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/modules/vip_gift/vip_gift_card_controller.dart';
import 'package:wetv/app/widgets/molecules/filter_chip_item.dart';
import 'package:wetv/app/widgets/molecules/selectable_option_card.dart';
import 'package:wetv/app/widgets/organisms/vip_gift_card_preview.dart';

// [VN] Màn tặng thẻ VIP cho bạn bè
class VipGiftCardView extends GetView<VipGiftCardController> {
  const VipGiftCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: controller.onBack,
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          color: AppColors.white_primary,
        ),
        title: Text(
          TrKeys.giveVipGiftTitle.tr,
          style: const TextStyle(
            color: AppColors.white_primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final cards = controller.cards.toList();
        final packages = controller.packages.toList();
        final cardIndex = controller.selectedCardIndex.value;
        final packageIndex = controller.selectedPackageIndex.value;
        final quantityIndex = controller.selectedQuantityIndex.value;

        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          TrKeys.selectVipCard.tr,
                          style: const TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      _HeaderAction(
                        icon: Icons.description_outlined,
                        label: TrKeys.rules.tr,
                        onTap: controller.onRulesTap,
                      ),
                      const SizedBox(width: 12),
                      _HeaderAction(
                        icon: Icons.confirmation_number_outlined,
                        label: TrKeys.purchased.tr,
                        onTap: controller.onPurchasedTap,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 36,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: cards.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: 8),
                            itemBuilder: (context, index) {
                              return FilterChipItem(
                                label: cards[index].title,
                                selected: cardIndex == index,
                                filledWhenSelected: true,
                                onTap: () => controller.selectCard(index),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: controller.onViewAllTap,
                          child: Row(
                            children: [
                              Text(
                                TrKeys.viewAll.tr,
                                style: const TextStyle(
                                  color: AppColors.orange_primary,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Icon(
                                Icons.view_list,
                                color: AppColors.orange_primary,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  VipGiftCardPreview(card: cards[cardIndex]),
                  const SizedBox(height: 8),
                  Text(
                    TrKeys.cardPictureHint.tr,
                    style: const TextStyle(
                      color: AppColors.gray_600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    TrKeys.choosePackage.tr,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: packages.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final package = packages[index];
                        return SelectableOptionCard(
                          label: package.label,
                          subLabel: package.priceLabel,
                          selected: packageIndex == index,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          onTap: () => controller.selectPackage(index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    TrKeys.numberOfCards.tr,
                    style: const TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.quantities.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final qty = controller.quantities[index];
                        return SelectableOptionCard(
                          label: '× $qty',
                          selected: quantityIndex == index,
                          minWidth: 64,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          onTap: () => controller.selectQuantity(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // [VN] Thanh thanh toán dưới cùng
            SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  border: Border(
                    top: BorderSide(color: AppColors.gray_800),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      controller.totalPriceLabel,
                      style: const TextStyle(
                        color: AppColors.orange_primary,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: controller.onConfirmPay,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange_primary,
                        foregroundColor: AppColors.white_primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        TrKeys.confirmToPay.tr,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _HeaderAction extends StatelessWidget {
  const _HeaderAction({
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.white_primary, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white_primary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
