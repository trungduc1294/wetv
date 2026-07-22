import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Panel dropdown danh sách lựa chọn dạng lưới (như hình 2)
class FilterDropdownPanel extends StatelessWidget {
  const FilterDropdownPanel({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
    this.crossAxisCount = 3,
    this.padding = const EdgeInsets.fromLTRB(12, 8, 12, 16),
  });

  final List<String> options;
  final int selectedIndex;
  final void Function(int index) onSelected;
  final int crossAxisCount;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: padding,
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: List.generate(options.length, (index) {
          final selected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: SizedBox(
              width: (MediaQuery.sizeOf(context).width - 24 - 16) / crossAxisCount,
              child: Text(
                options[index],
                style: TextStyle(
                  color: selected
                      ? AppColors.orange_primary
                      : AppColors.white_primary,
                  fontSize: 14,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
