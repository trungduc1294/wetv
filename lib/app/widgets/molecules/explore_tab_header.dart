import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Header tab Khám phá: chuyển BXH / Lọc + icon search
class ExploreTabHeader extends StatelessWidget {
  const ExploreTabHeader({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    this.onSearchTap,
    this.tabs = const ['BXH', 'Lọc'],
  });

  // [VN] 0 = BXH, 1 = Lọc
  final int selectedIndex;
  final void Function(int index) onTabChanged;
  final VoidCallback? onSearchTap;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // [VN] Tabs BXH / Lọc căn giữa
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(tabs.length, (index) {
              final selected = selectedIndex == index;
              return GestureDetector(
                onTap: () => onTabChanged(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    tabs[index],
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
