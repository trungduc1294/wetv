import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/molecules/filter_chip_item.dart';
import 'package:wetv/app/widgets/molecules/filter_dropdown_button.dart';
import 'package:wetv/app/widgets/molecules/filter_dropdown_panel.dart';

// [VN] Thanh filter BXH: dropdown trái + chips ngang + panel dropdown
class ExploreRankingFilterBar extends StatelessWidget {
  const ExploreRankingFilterBar({
    super.key,
    required this.dropdownLabel,
    required this.dropdownOptions,
    required this.dropdownSelectedIndex,
    required this.dropdownExpanded,
    required this.onDropdownToggle,
    required this.onDropdownSelected,
    required this.chipLabels,
    required this.selectedChipIndex,
    required this.onChipSelected,
  });

  final String dropdownLabel;
  final List<String> dropdownOptions;
  final int dropdownSelectedIndex;
  final bool dropdownExpanded;
  final VoidCallback onDropdownToggle;
  final void Function(int index) onDropdownSelected;
  final List<String> chipLabels;
  final int selectedChipIndex;
  final void Function(int index) onChipSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Row(
            children: [
              // [VN] Dropdown filter danh sách bên trái
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: FilterDropdownButton(
                  label: dropdownLabel,
                  expanded: dropdownExpanded,
                  onTap: onDropdownToggle,
                ),
              ),
              Container(
                width: 1,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: AppColors.gray_800,
              ),
              // [VN] Horizon nav chips filter theo tiêu chí
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 12),
                  itemCount: chipLabels.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return Center(
                      child: FilterChipItem(
                        label: chipLabels[index],
                        selected: selectedChipIndex == index,
                        highlightBorder: true,
                        onTap: () => onChipSelected(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // [VN] Panel dropdown mở khi click nút dropdown
        if (dropdownExpanded)
          FilterDropdownPanel(
            options: dropdownOptions,
            selectedIndex: dropdownSelectedIndex,
            onSelected: onDropdownSelected,
          ),
      ],
    );
  }
}
