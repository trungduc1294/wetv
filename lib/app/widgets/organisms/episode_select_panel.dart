import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/molecules/episode_chip.dart';

// [VN] Bottom panel chọn tập (Ảnh 6)
class EpisodeSelectPanel extends StatelessWidget {
  const EpisodeSelectPanel({
    super.key,
    required this.totalEpisodes,
    required this.selectedEpisode,
    required this.versionLabel,
    required this.onEpisodeTap,
    this.onVersionTap,
  });

  final int totalEpisodes;
  final int selectedEpisode;
  final String versionLabel;
  final void Function(int episode) onEpisodeTap;
  final VoidCallback? onVersionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.62,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onVersionTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      versionLabel,
                      style: const TextStyle(
                        color: AppColors.white_primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white_primary,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: totalEpisodes,
              itemBuilder: (context, index) {
                final episode = index + 1;
                return EpisodeChip(
                  number: episode,
                  selected: episode == selectedEpisode,
                  onTap: () => onEpisodeTap(episode),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
