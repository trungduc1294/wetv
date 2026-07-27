import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/modules/coins/coins_controller.dart';
import 'package:wetv/app/widgets/molecules/coin_balance_card.dart';
import 'package:wetv/app/widgets/molecules/coin_package_card.dart';
import 'package:wetv/app/widgets/molecules/section_header_link.dart';
import 'package:wetv/app/widgets/organisms/movie_vertical_card_list.dart';

// [VN] Màn hình Coins của tôi
class CoinsView extends GetView<CoinsController> {
  const CoinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // [VN] Header vàng nhạt + back + title
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF4D6), Colors.white],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          'Coins của tôi',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Positioned(
                          left: 4,
                          child: IconButton(
                            onPressed: controller.onBack,
                            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                    child: GestureDetector(
                      onTap: controller.onLoginTap,
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFFE0E0E0),
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Đăng nhập',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final packages = controller.packages.toList();
              final movies = controller.watchMovies.toList();
              final balance = controller.balance.value;

              return ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                children: [
                  CoinBalanceCard(balance: balance),
                  const SizedBox(height: 20),
                  SectionHeaderLink(
                    title: 'Nạp coins',
                    actionLabel: 'Coins là gì >',
                    onActionTap: controller.onWhatAreCoins,
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: packages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final package = packages[index];
                      return CoinPackageCard(
                        package: package,
                        onTap: () => controller.onBuyPackage(package),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: GestureDetector(
                      onTap: controller.onTermsTap,
                      child: const Text(
                        'Điều khoản dịch vụ >',
                        style: TextStyle(
                          color: AppColors.gray_600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const SectionHeaderLink(title: 'Dùng coins để xem'),
                  const SizedBox(height: 12),
                  MovieVerticalCardList(
                    movies: movies,
                    height: 200,
                    padding: EdgeInsets.zero,
                    onMovieTap: controller.onMovieTap,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
