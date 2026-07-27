import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/modules/movie_list/movie_list_controller.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';
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

  // [VN] Mở màn chi tiết phim
  void _openMovieDetail() {
    Get.toNamed(AppRoutes.MOVIE_DETAIL);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MovieHeroSlider(
            height: 420,
            slides: const [
              MovieHeroSlide(
                title: 'Bách Hoa Sát',
                foregroundUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                backgroundUrl:
                    'https://picsum.photos/seed/bg1/800/800',
              ),
              MovieHeroSlide(
                title: 'Liễu Chu Ký',
                foregroundUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                backgroundUrl:
                    'https://picsum.photos/seed/bg2/800/800',
              ),
              MovieHeroSlide(
                title: 'Trực Ngọc',
                foregroundUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                backgroundUrl:
                    'https://picsum.photos/seed/bg3/800/800',
              ),
              MovieHeroSlide(
                title: 'Mạc Ly',
                foregroundUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                backgroundUrl:
                    'https://picsum.photos/seed/bg4/800/800',
              ),
            ],
            onSlideTap: (_, index) => _openMovieDetail(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CategoryHeading(
              title: 'Tiep tuc xem',
              icon: Icons.arrow_forward_ios,
            ),
          ),
          MovieVerticalCardList(
            movies: [
              MovieModel(
                id: '1',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
            ],
            onMovieTap: (_) => _openMovieDetail(),
          ),

          SizedBox(height: 20),

          MovieHorizontalCardList(
            movies: [
              MovieModel(
                id: '1',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
                shortDescription: 'Short Description',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Movie Title',
              ),
            ],
            onMovieTap: (_) => _openMovieDetail(),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CategoryHeading(
              title: 'Bang xep hang',
              icon: Icons.arrow_forward_ios,
            ),
          ),
          MovieRankingList(
            movies: [
              MovieModel(
                id: '1',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Bạch Hoa Sát',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Giấy Phút Vượt Qua Giới Hạn',
              ),
              MovieModel(
                id: '3',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Mạc Ly',
              ),
              MovieModel(
                id: '4',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Tình Hà Xử',
              ),
            ],
            maxRankingItems: 4,
            onMovieTap: (_) => _openMovieDetail(),
          ),

          SizedBox(height: 20),

          MovieGrid(
            movies: [
              MovieModel(
                id: '1',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Liễu Chu Ký',
              ),
              MovieModel(
                id: '2',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Trực Ngọc',
              ),
              MovieModel(
                id: '3',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Mạc Ly',
              ),
              MovieModel(
                id: '4',
                posterUrl:
                    'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                movieName: 'Nghe Nói Em Thích Tôi',
              ),
            ],
            showTitle: true,
            spacing: 10,
            spacingY: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            onMovieTap: (_) => _openMovieDetail(),
          ),

          SizedBox(height: 20),

          MovieDetailHorizontalPanel(
            height: 320,
            detail: MovieDetailInfo(
              posterUrl:
                  'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
              title: 'Rất Muốn Ở Bên Anh',
              tags: const [
                MovieTag(label: 'Xem Miễn Phí'),
                MovieTag(label: 'WeTV Selected', filled: true),
                MovieTag(label: 'Trọn bộ 24 tập'),
              ],
              shortDescription:
                  'Hài Kịch Tình Yêu · Mary Sue · Hướng Tới Nữ Giới · Chuy...',
              featuredImages: const [
                'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
              ],
              reviews: const [
                MovieReview(
                  userName: 'Maryam Hajra Equbal',
                  date: '2021-08-28 15:40:17',
                  comment:
                      'Bộ phim này đã làm tôi cảm nhận được vẻ đẹp của tình yêu, câu chuyện giữa họ thực sự rất chữa lành. Mặc dù có khó khăn và thách thức, nhưng họ không từ bỏ, kết quả cũng hoàn hảo🎇.',
                ),
                MovieReview(
                  userName: 'Sonali Huber',
                  date: '2021-08-28 15:40:17',
                  comment:
                      'Tưởng là phim ngọt ngào bình thường, ai ngờ Qi Niên tiếp cận giáo sư để vẽ truyện tranh hay hơn tưởng tượng nhiều. Xem mà cười suốt 😄.',
                ),
              ],
              summary:
                  'Bộ phim kể về một cô gái "không sân si" làm công việc sáng tác truyện tranh tên Thích Niên. Vì để châm thêm dầu cho ngọn đèn đang cạn ý tưởng của mình, cô đã chủ động tiếp cận giáo sư lạnh lùng Kỷ Ngôn Tín để thu thập tư liệu thực tế. Nào ngờ, cuối cùng lại thu hoạch được câu chuyện tình yêu định mệnh.',
              sideScenes: const [
                MovieSideScene(
                  id: '1',
                  thumbnailUrl:
                      'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                  title:
                      'Cô nàng họa sĩ lắm trò | Hậu trường độc quyền Rất Muốn Ở Bên Anh',
                  duration: '01:25',
                ),
                MovieSideScene(
                  id: '2',
                  thumbnailUrl:
                      'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                  title:
                      'Cô nàng họa sĩ lắm trò | Hậu trường độc quyền Rất Muốn Ở Bên Anh',
                  duration: '04:55',
                ),
                MovieSideScene(
                  id: '3',
                  thumbnailUrl:
                      'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
                  title:
                      'Cô nàng họa sĩ lắm trò | Hậu trường độc quyền Rất Muốn Ở Bên Anh',
                  duration: '02:10',
                ),
              ],
            ),
            onAddToPlaylist: () {},
            onSideSceneTap: (_) {},
            onMoreSideScenesTap: () {},
          ),
        ],
      ),
    );
  }
}
