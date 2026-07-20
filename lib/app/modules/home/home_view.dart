import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/modules/home/home_controller.dart';
import 'package:wetv/app/modules/movie_list/movie_list_view.dart';
import 'package:wetv/app/widgets/organisms/home_header.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/horizon_nav_bar.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/horizon_nav_bar_controller.dart';

class HomeView extends GetView<Homecontroller> {
  HomeView({super.key});
  final horizonNavBarController = Get.put(Horizonnavbarcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Obx(() => _buildTabContent(controller.selectedIndex.value)),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.gray_900,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: AppColors.orange_primary,
          unselectedItemColor: AppColors.gray_600,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: 'Short',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Khám phá',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
    );
  }

  // [VN] Nội dung theo tab bottom navigation
  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return _buildHomeTab();
      case 1:
        return const Center(
          child: Text(
            'Short',
            style: TextStyle(color: AppColors.white_primary),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            'Khám phá',
            style: TextStyle(color: AppColors.white_primary),
          ),
        );
      case 3:
        return const Center(
          child: Text(
            'Tài khoản',
            style: TextStyle(color: AppColors.white_primary),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  // [VN] Tab Trang chủ: header + category navbar + movie list
  Widget _buildHomeTab() {
    return Column(
      children: [
        HomeHeader(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: HorizonNavBar(),
        ),
        Expanded(
          child: Obx(() {
            switch (horizonNavBarController.selectedIndex.value) {
              case 0:
                return MovieListView();
              case 1:
                return const Center(
                  child: Text(
                    'Nội dung trang: PHIM TRUYỆN',
                    style: TextStyle(color: AppColors.white_primary),
                  ),
                );
              case 2:
                return const Center(
                  child: Text(
                    'Nội dung trang: ANIME',
                    style: TextStyle(color: AppColors.white_primary),
                  ),
                );
              case 3:
                return const Center(
                  child: Text(
                    'Nội dung trang: CỔ TRANG',
                    style: TextStyle(color: AppColors.white_primary),
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          }),
        ),
      ],
    );
  }
}
