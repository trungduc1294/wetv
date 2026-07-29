import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/modules/account/account_view.dart';
import 'package:wetv/app/modules/explore/explore_view.dart';
import 'package:wetv/app/modules/home/home_controller.dart';
import 'package:wetv/app/modules/movie_list/movie_list_view.dart';
import 'package:wetv/app/modules/shorts/shorts_view.dart';
import 'package:wetv/app/widgets/organisms/home_header.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/horizon_nav_bar.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/horizon_nav_bar_controller.dart';

class HomeView extends GetView<Homecontroller> {
  HomeView({super.key});
  final horizonNavBarController = Get.put(Horizonnavbarcontroller());

  // [VN] Chiều cao phần header (search row + category navbar + vùng gradient) để chừa chỗ nội dung
  static const double _headerHeight = 132;

  // [VN] Khoảng scroll để header chuyển dần sang nền primary đặc
  static const double _headerFadeDistance = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Obx(() => _buildTabContent(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.gray_900,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: AppColors.orange_primary,
          unselectedItemColor: AppColors.gray_600,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: TrKeys.navHome.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.play_circle),
              label: TrKeys.navShort.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.explore),
              label: TrKeys.navExplore.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: TrKeys.navAccount.tr,
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
        return SafeArea(child: ShortsView());
      case 2:
        return SafeArea(child: ExploreView());
      case 3:
        return SafeArea(child: AccountView());
      default:
        return const SizedBox.shrink();
    }
  }

  // [VN] Tab Trang chủ: nội dung tràn full, header nổi phía trên hero slide
  Widget _buildHomeTab() {
    return NotificationListener<ScrollNotification>(
      // [VN] Chỉ lấy scroll dọc, bỏ qua các list ngang bên trong
      onNotification: (notification) {
        if (notification.metrics.axis == Axis.vertical) {
          controller.updateScrollOffset(notification.metrics.pixels);
        }
        return false;
      },
      child: Stack(
        children: [
          Positioned.fill(child: Obx(() => _buildCategoryContent())),
          Positioned(top: 0, left: 0, right: 0, child: _buildFloatingHeader()),
        ],
      ),
    );
  }

  // [VN] Header mờ trên hero slide, chuyển sang nền primary khi scroll qua hero
  Widget _buildFloatingHeader() {
    // [VN] Dựng sẵn nội dung ngoài Obx để không rebuild lại khi scroll
    final Widget headerContent = SafeArea(
      bottom: false,
      child: Column(
        children: [
          HomeHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: HorizonNavBar(),
          ),
        ],
      ),
    );

    return Obx(
      () => DecoratedBox(
        decoration: BoxDecoration(
          gradient: _headerGradient(_headerSolidProgress()),
        ),
        child: headerContent,
      ),
    );
  }

  // [VN] 0 = đang nằm trên hero slide, 1 = đã scroll qua hero
  double _headerSolidProgress() {
    // [VN] Các tab category khác không có hero slide nên dùng nền đặc luôn
    if (horizonNavBarController.selectedIndex.value != 0) return 1;

    final double fadeStart =
        MovieListView.heroSliderHeight - _headerHeight - _headerFadeDistance;
    final double scrolled = controller.scrollOffset.value - fadeStart;
    return (scrolled / _headerFadeDistance).clamp(0.0, 1.0);
  }

  // [VN] Gradient chuyển dần về primary đặc theo progress
  LinearGradient _headerGradient(double progress) {
    final List<Color> heroColors = [
      AppColors.orange_primary.withValues(alpha: 0.75),
      AppColors.orange_primary.withValues(alpha: 0.55),
      AppColors.orange_primary.withValues(alpha: 0.45),
      AppColors.orange_primary.withValues(alpha: 0),
    ];

    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: heroColors
          .map((color) => Color.lerp(color, AppColors.gray_900, progress)!)
          .toList(),
      stops: const [0, 0.45, 0.75, 1],
    );
  }

  // [VN] Nội dung theo tab category ngang
  Widget _buildCategoryContent() {
    // [VN] Đổi tab -> scroll view mới bắt đầu từ 0, đồng bộ lại offset cho header
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.updateScrollOffset(0),
    );

    switch (horizonNavBarController.selectedIndex.value) {
      case 0:
        return MovieListView();
      case 1:
        return _buildPlaceholder(TrKeys.filmStory.tr);
      case 2:
        return _buildPlaceholder(TrKeys.anime.tr);
      case 3:
        return _buildPlaceholder(TrKeys.costume.tr.toUpperCase());
      default:
        return const SizedBox.shrink();
    }
  }

  // [VN] Tab chưa có nội dung: chừa chỗ cho header nổi phía trên
  Widget _buildPlaceholder(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: _headerHeight),
      child: Center(
        child: Text(
          TrKeys.contentPagePrefix.trParams({'name': name}),
          style: const TextStyle(color: AppColors.white_primary),
        ),
      ),
    );
  }
}
