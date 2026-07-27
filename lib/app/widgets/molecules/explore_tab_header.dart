import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Header tab Khám phá: chuyển BXH / Lọc + icon search
class ExploreTabHeader extends StatelessWidget {
  const ExploreTabHeader({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    this.onSearchTap,
    this.tabs,
  });

  // [VN] 0 = BXH, 1 = Lọc
  final int selectedIndex;
  final void Function(int index) onTabChanged;
  final VoidCallback? onSearchTap;
  final List<String>? tabs;

  @override
  Widget build(BuildContext context) {
    final labels = tabs ?? [TrKeys.bxh.tr, TrKeys.filter.tr];

    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // [VN] Tabs BXH / Lọc căn giữa
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(labels.length, (index) {
              final selected = selectedIndex == index;
              return GestureDetector(
                onTap: () => onTabChanged(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color: selected
                          ? AppColors.white_primary
                          : AppColors.gray_600,
                      fontSize: selected ? 20 : 16,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
          ),
          // [VN] Icon search góc phải
          Positioned(
            right: 4,
            child: IconButton(
              onPressed: onSearchTap,
              icon: const Icon(Icons.search),
              color: AppColors.white_primary,
            ),
          ),
        ],
      ),
    );
  }
}
