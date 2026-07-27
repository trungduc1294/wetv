import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';
import 'package:wetv/app/widgets/molecules/movie_grid.dart';

// [VN] Bottom panel hồ sơ diễn viên (Ảnh 8)
class ActorProfilePanel extends StatelessWidget {
  const ActorProfilePanel({
    super.key,
    required this.actor,
    this.onClose,
    this.onWorkTap,
  });

  final ActorModel actor;
  final VoidCallback? onClose;
  final void Function(MovieModel movie)? onWorkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.72,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hồ sơ cá nhân',
                    style: TextStyle(
                      color: AppColors.white_primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onClose ?? () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  color: AppColors.white_primary,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.gray_800,
                      backgroundImage: actor.avatarUrl.isNotEmpty
                          ? NetworkImage(actor.avatarUrl)
                          : null,
                      child: actor.avatarUrl.isEmpty
                          ? const Icon(Icons.person,
                              color: AppColors.white_primary)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actor.name,
                          style: const TextStyle(
                            color: AppColors.white_primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (actor.birthday.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            actor.birthday,
                            style: const TextStyle(
                              color: AppColors.gray_600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Giới thiệu',
                  style: TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _InfoRow(label: 'Giới tính', value: actor.gender),
                _InfoRow(label: 'Sinh nhật', value: actor.birthday),
                _InfoRow(label: 'Chòm sao', value: actor.zodiac),
                const SizedBox(height: 20),
                const Text(
                  'Tác phẩm của anh ấy/cô ấy',
                  style: TextStyle(
                    color: AppColors.white_primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                if (actor.works.isNotEmpty)
                  SizedBox(
                    height: 280,
                    child: MovieGrid(
                      movies: actor.works,
                      crossAxisCount: 3,
                      imageAspectRatio: 2 / 3,
                      maxLines: 2,
                      spacing: 8,
                      spacingY: 10,
                      padding: EdgeInsets.zero,
                      onMovieTap: (movie) => onWorkTap?.call(movie),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(color: AppColors.gray_600, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.white_primary,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
