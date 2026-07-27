import 'package:flutter/material.dart';
import 'package:wetv/app/data/models/movie_watch_detail_model.dart';
import 'package:wetv/app/widgets/molecules/actor_avatar_item.dart';

// [VN] Danh sách ngang diễn viên
class ActorHorizontalList extends StatelessWidget {
  const ActorHorizontalList({
    super.key,
    required this.actors,
    required this.onActorTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.spacing = 12,
  });

  final List<ActorModel> actors;
  final void Function(ActorModel actor) onActorTap;
  final EdgeInsetsGeometry padding;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: actors.length,
        separatorBuilder: (_, _) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          final actor = actors[index];
          return ActorAvatarItem(
            actor: actor,
            onTap: () => onActorTap(actor),
          );
        },
      ),
    );
  }
}
