import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/horizon_nav_bar_controller.dart';

// [VN] Thanh điều hướng category ngang trên trang Home
class HorizonNavBar extends StatelessWidget {
  const HorizonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final horizonNavBarController = Get.put(Horizonnavbarcontroller());
    return SizedBox(
      height: 45,
      child: Obx(() {
        // [VN] Đọc selectedIndex ngoài itemBuilder để Obx theo dõi được
        final int selectedIndex = horizonNavBarController.selectedIndex.value;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: horizonNavBarController.categories.length,
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () => horizonNavBarController.changeTab(index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    horizonNavBarController.categories[index].name,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.white_primary
                          : AppColors.gray_600,
                      fontSize: 16,
                      fontWeight: isSelected
                          ? FontWeight.w500
                          : FontWeight.w300,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
