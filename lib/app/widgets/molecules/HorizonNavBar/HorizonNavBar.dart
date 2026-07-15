import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/theme/AppColors.dart';
import 'package:wetv/app/widgets/molecules/HorizonNavBar/HorizonNavBarController.dart';

class HorizonNavBar extends StatelessWidget {
  const HorizonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final horizonNavBarController = Get.put(Horizonnavbarcontroller());
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: horizonNavBarController.navItems.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final bool isSelected =
                horizonNavBarController.selectedIndex.value == index;

            return GestureDetector(
              onTap: () => horizonNavBarController.changeTab(index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    horizonNavBarController.navItems[index],
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
          });
        },
      ),
    );
  }
}
