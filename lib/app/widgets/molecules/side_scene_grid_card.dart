import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';

// [VN] Card video cảnh bên lề (thumbnail + title)
class SideSceneGridCard extends StatelessWidget {
  const SideSceneGridCard({
    super.key,
    required this.scene,
    this.onTap,
    this.imageAspectRatio = 16 / 10,
    this.imageRadius = 8,
  });

  final MovieSideScene scene;
  final VoidCallback? onTap;
  final double imageAspectRatio;
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: imageAspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(imageRadius),
              child: Image.network(
                scene.thumbnailUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            scene.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.white_primary,
              fontSize: 13,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
