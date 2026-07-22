import 'package:flutter/material.dart';
import 'package:wetv/app/widgets/molecules/filter_chip_item.dart';

// [VN] Một nhóm filter ngang trong tab Lọc
class FilterChipGroup {
  const FilterChipGroup({
    required this.options,
    required this.selectedIndex,
  });

  final List<String> options;
  final int selectedIndex;
}

// [VN] Header filter tab Lọc: nhiều hàng horizon chip
class ExploreFilterGroups extends StatelessWidget {
  const ExploreFilterGroups({
    super.key,
    required this.groups,
    required this.onChipSelected,
    this.spacing = 8,
    this.runSpacing = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });

  final List<FilterChipGroup> groups;
  // [VN] groupIndex, chipIndex — gọi fetch data từ ngoài
  final void Function(int groupIndex, int chipIndex) onChipSelected;
  final double spacing;
  final double runSpacing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: List.generate(groups.length, (groupIndex) {
          final group = groups[groupIndex];
          return Padding(
            padding: EdgeInsets.only(
              bottom: groupIndex == groups.length - 1 ? 0 : runSpacing,
            ),
            child: SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: group.options.length,
                separatorBuilder: (_, _) => SizedBox(width: spacing),
                itemBuilder: (context, chipIndex) {
                  final selected = group.selectedIndex == chipIndex;
                  // [VN] Hàng đầu (sort) dùng nền cam; các hàng sau dùng chữ cam
                  final isSortRow = groupIndex == 0;
                  return FilterChipItem(
                    label: group.options[chipIndex],
                    selected: selected,
                    filledWhenSelected: isSortRow,
                    onTap: () => onChipSelected(groupIndex, chipIndex),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
