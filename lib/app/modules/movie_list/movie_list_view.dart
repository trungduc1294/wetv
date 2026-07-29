import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/modules/movie_list/movie_list_controller.dart';
import 'package:wetv/app/routes/app_routes.dart';
import 'package:wetv/app/widgets/organisms/movie_vertical_card_list.dart';
import 'package:wetv/app/widgets/organisms/movie_horizontal_card_list.dart';
import 'package:wetv/app/widgets/organisms/movie_ranking_list.dart';
import 'package:wetv/app/widgets/organisms/movie_detail_horizontal_panel.dart';
import 'package:wetv/app/widgets/organisms/movie_hero_slider.dart';
import 'package:wetv/app/widgets/molecules/category_heading.dart';
import 'package:wetv/app/widgets/molecules/movie_grid.dart';

class MovieListView extends GetView<MovieListController> {
  const MovieListView({super.key});

  // [VN] Chiều cao hero slider, HomeView dùng để tính ngưỡng đổi nền header
  static const double heroSliderHeight = 560;

  // [VN] Mở màn chi tiết phim
  void _openMovieDetail() {
    Get.toNamed(AppRoutes.MOVIE_DETAIL);
  }

  @override
  Widget build(BuildContext context) {
    // [VN] Controller cho trang movie list
    final movieListController = Get.put(MovieListController());

    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => MovieHeroSlider(
              height: heroSliderHeight,
              slides: movieListController.movieHeroSlides.toList(),
              onSlideTap: (_, index) => _openMovieDetail(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CategoryHeading(
              title: TrKeys.continueWatching.tr,
              icon: Icons.arrow_forward_ios,
            ),
          ),

          // [VN] Danh sách movie vertical card list
          Obx(
            () => MovieVerticalCardList(
              movies: movieListController.movieList.toList(),
              onMovieTap: (_) => _openMovieDetail(),
            ),
          ),

          SizedBox(height: 20),

          // [VN] Danh sách movie horizontal card list
          Obx(
            () => MovieHorizontalCardList(
              movies: movieListController.movieList.toList(),
              onMovieTap: (_) => _openMovieDetail(),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CategoryHeading(
              title: TrKeys.ranking.tr,
              icon: Icons.arrow_forward_ios,
            ),
          ),

          // [VN] Danh sách movie ranking list
          Obx(
            () => MovieRankingList(
              movies: movieListController.movieList.toList(),
              maxRankingItems: 10,
              onMovieTap: (_) => _openMovieDetail(),
            ),
          ),

          SizedBox(height: 20),

          // [VN] Danh sách movie grid
          Obx(
            () => MovieGrid(
              movies: movieListController.movieList.take(4).toList(),
              showTitle: true,
              spacing: 10,
              spacingY: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onMovieTap: (_) => _openMovieDetail(),
            ),
          ),

          SizedBox(height: 20),

          // [VN] Danh sách panel chi tiết phim xếp theo cột
          Obx(
            () => Column(
              children: movieListController.movieListDetailInfo
                  .map(
                    (detail) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: MovieDetailHorizontalPanel(
                        height: 320,
                        detail: detail,
                        onAddToPlaylist: () {},
                        onSideSceneTap: (_) {},
                        onMoreSideScenesTap: () {},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
