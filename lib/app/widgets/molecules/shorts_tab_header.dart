import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/atoms/app_logo.dart';

// [VN] Header Shorts: tab For You / All + menu / logo
class ShortsTabHeader extends StatelessWidget {
  const ShortsTabHeader({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
    this.onMoreTap,
    this.tabs,
    this.showLogo = true,
  });

  // [VN] 0 = For You, 1 = All
  final int selectedIndex;
  final void Function(int index) onTabChanged;
  final VoidCallback? onMoreTap;
  final List<String>? tabs;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    final labels = tabs ?? [TrKeys.forYou.tr, TrKeys.all.tr];

    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(labels.length, (index) {
              final selected = selectedIndex == index;
              return GestureDetector(
                onTap: () => onTabChanged(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color: selected
                          ? AppColors.white_primary
                          : AppColors.gray_600,
                      fontSize: selected ? 18 : 16,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }),
          ),
          Positioned(
            right: 4,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showLogo && selectedIndex == 0)
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: AppLogo(width: 28, height: 28),
                  ),
                IconButton(
                  onPressed: onMoreTap,
                  icon: const Icon(Icons.more_horiz),
                  color: AppColors.white_primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
