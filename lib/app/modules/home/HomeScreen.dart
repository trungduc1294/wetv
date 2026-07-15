import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/theme/AppColors.dart';
import 'package:wetv/app/modules/home/HomeController.dart';
import 'package:wetv/app/widgets/organisms/HomeHeader.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/HorizonNavBar.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/HorizonNavBarController.dart';

class HomeScreen extends GetView<Homecontroller> {
  HomeScreen({super.key});
  final horizonNavBarController = Get.put(Horizonnavbarcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              // Header
              HomeHeader(),
              // Horizon NavBar
              HorizonNavBar(),
              Expanded(
                child: Obx(() {
                  // Tự động nhảy vào case tương ứng khi selectedIndex.value thay đổi
                  switch (horizonNavBarController.selectedIndex.value) {
                    case 0:
                      return const Center(
                        child: Text('Nội dung trang: NỔI BẬT'),
                      );
                    case 1:
                      return const Center(
                        child: Text('Nội dung trang: PHIM TRUYỆN'),
                      );
                    case 2:
                      return const Center(child: Text('Nội dung trang: ANIME'));
                    case 3:
                      return const Center(
                        child: Text('Nội dung trang: CỔ TRANG'),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.gray_900,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
