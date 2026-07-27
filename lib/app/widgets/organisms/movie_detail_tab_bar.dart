import 'package:flutter/material.dart';
import 'package:wetv/app/widgets/molecules/movie_detail_tab_item.dart';

// [VN] Một tab trong thanh điều hướng chi tiết phim
class MovieDetailTab {
  const MovieDetailTab({
    required this.label,
    this.showPlayIcon = false,
  });

  final String label;
  final bool showPlayIcon;
}

// [VN] Navbar ngang các tab chi tiết phim
class MovieDetailTabBar extends StatelessWidget {
  const MovieDetailTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<MovieDetailTab> tabs;
  final int selectedIndex;
  final void Function(int index) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          return MovieDetailTabItem(
            label: tab.label,
            selected: selectedIndex == index,
            showPlayIcon: tab.showPlayIcon,
            onTap: () => onTabChanged(index),
          );
        },
      ),
    );
  }
}
