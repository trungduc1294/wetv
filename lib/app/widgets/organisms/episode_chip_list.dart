import 'package:flutter/material.dart';
import 'package:wetv/app/widgets/molecules/episode_chip.dart';

// [VN] Danh sách ngang các chip tập phim
class EpisodeChipList extends StatelessWidget {
  const EpisodeChipList({
    super.key,
    required this.totalEpisodes,
    required this.selectedEpisode,
    required this.onEpisodeTap,
    this.visibleCount = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.spacing = 8,
  });

  final int totalEpisodes;
  final int selectedEpisode;
  final void Function(int episode) onEpisodeTap;
  final int visibleCount;
  final EdgeInsetsGeometry padding;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final count = totalEpisodes.clamp(0, visibleCount);
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: count,
        separatorBuilder: (_, _) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          final episode = index + 1;
          return EpisodeChip(
            number: episode,
            selected: episode == selectedEpisode,
            size: 44,
            onTap: () => onEpisodeTap(episode),
          );
        },
      ),
    );
  }
}
