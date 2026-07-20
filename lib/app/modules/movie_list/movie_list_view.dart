import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/modules/movie_list/movie_list_controller.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/widgets/organisms/movie_vertical_card_list.dart';
import 'package:wetv/app/widgets/organisms/movie_horizontal_card_list.dart';
import 'package:wetv/app/widgets/molecules/category_heading.dart';

class MovieListView extends GetView<MovieListController> {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          onMovieTap: (movie) {
            print(movie.movieName);
          },
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
          onMovieTap: (movie) {
            print(movie.movieName);
          },
        ),
      ],
    );
  }
}
