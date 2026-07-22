import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/modules/explore/explore_controller.dart';
import 'package:wetv/app/widgets/molecules/explore_tab_header.dart';
import 'package:wetv/app/widgets/molecules/movie_grid.dart';
import 'package:wetv/app/widgets/organisms/explore_filter_groups.dart';
import 'package:wetv/app/widgets/organisms/explore_ranking_filter_bar.dart';
import 'package:wetv/app/widgets/organisms/ranking_movie_list.dart';

// [VN] Màn hình tab Khám phá: BXH + Lọc
class ExploreView extends GetView<ExploreController> {
  ExploreView({super.key}) {
    Get.put(ExploreController());
  }

  @override
  Widget build(BuildContext context) {
    // [VN] Một Obx duy nhất — tránh nested Obx gây improper use
    return Obx(() {
      final tabIndex = controller.mainTabIndex.value;

      return Column(
        children: [
          // [VN] Header: tab BXH/Lọc + search
          ExploreTabHeader(
            selectedIndex: tabIndex,
            onTabChanged: controller.changeMainTab,
            onSearchTap: controller.onSearchTap,
          ),
          Expanded(
            child: tabIndex == 0
                ? _buildRankingTab()
                : _buildFilterTab(),
          ),
        ],
      );
    });
  }

  // [VN] Nội dung tab Bảng xếp hạng (đọc obs trong Obx cha)
  Widget _buildRankingTab() {
    final dropdownExpanded = controller.dropdownExpanded.value;
    final dropdownSelectedIndex = controller.dropdownSelectedIndex.value;
    final rankingChipIndex = controller.rankingChipIndex.value;
    final rankingMovies = controller.rankingMovies.toList();

    return Column(
      children: [
        ExploreRankingFilterBar(
          dropdownLabel: controller.dropdownOptions[dropdownSelectedIndex],
          dropdownOptions: controller.dropdownOptions,
          dropdownSelectedIndex: dropdownSelectedIndex,
          dropdownExpanded: dropdownExpanded,
          onDropdownToggle: controller.toggleDropdown,
          onDropdownSelected: controller.selectDropdownOption,
          chipLabels: controller.rankingChipLabels,
          selectedChipIndex: rankingChipIndex,
          onChipSelected: controller.selectRankingChip,
        ),
        Expanded(
          child: RankingMovieList(
            movies: rankingMovies,
            onMovieTap: controller.onRankingMovieTap,
          ),
        ),
      ],
    );
  }

  // [VN] Nội dung tab Lọc: nhóm filter + grid phim
  Widget _buildFilterTab() {
    // [VN] Đọc obs để Obx cha theo dõi thay đổi filter
    final selectedIndexes = controller.filterSelectedIndexes.toList();
    final filterMovies = controller.filterMovies.toList();
    final groups = List.generate(controller.filterGroupOptions.length, (i) {
      return FilterChipGroup(
        options: controller.filterGroupOptions[i],
        selectedIndex: selectedIndexes[i],
      );
    });

    return Column(
      children: [
        ExploreFilterGroups(
          groups: groups,
          onChipSelected: controller.selectFilterChip,
        ),
        Expanded(
          child: MovieGrid(
            movies: filterMovies,
            crossAxisCount: 3,
            imageAspectRatio: 2 / 3,
            maxLines: 2,
            spacing: 8,
            spacingY: 12,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            onMovieTap: controller.onFilterMovieTap,
          ),
        ),
      ],
    );
  }
}
