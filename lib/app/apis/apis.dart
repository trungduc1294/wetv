import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wetv/app/data/models/category_model.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/ranking_movie_model.dart';

class CategoriesApi {
  Future<List<CategoryModel>> getCategories() async {
    try {
      // [VN] Delay để mô phỏng API
      await Future.delayed(const Duration(milliseconds: 200));

      // [VN] Đọc danh sách category từ file dump JSON
      final String response = await rootBundle.loadString(
        'lib/app/data/dump/categories.json',
      );
      final List<dynamic> data = jsonDecode(response);

      return data
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}

class MovieListApi {
  // [VN] Lấy danh sách movie hero slide theo category
  Future<List<MovieHeroSlide>> getMovieHeroSlides({
    required int categoryId,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final String response = await rootBundle.loadString(
        'lib/app/data/dump/movie_hero_slide.json',
      );
      final List<dynamic> data = jsonDecode(response);
      final slides = data
          .map((json) => MovieHeroSlide.fromJson(json as Map<String, dynamic>))
          .toList();

      return _rotateByCategory(slides, categoryId);
    } catch (e) {
      rethrow;
    }
  }

  // [VN] Lấy danh sách movie list theo category
  Future<List<MovieModel>> getMovieList({required int categoryId}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final String response = await rootBundle.loadString(
        'lib/app/data/dump/movie_list.json',
      );
      final List<dynamic> data = jsonDecode(response);
      final movies = data
          .map(
            (json) => MovieModel.fromJson(
              json as Map<String, dynamic>,
              data.indexOf(json),
            ),
          )
          .toList();

      return _rotateByCategory(movies, categoryId);
    } catch (e) {
      rethrow;
    }
  }

  // [VN] Lấy thông tin danh sách film chi tiết theo category
  Future<List<MovieDetailInfo>> getMovieListDetailInfo({
    required int categoryId,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final String response = await rootBundle.loadString(
        'lib/app/data/dump/movie_list_detail_info.json',
      );
      final List<dynamic> data = jsonDecode(response);
      final details = data
          .map((json) => MovieDetailInfo.fromJson(json as Map<String, dynamic>))
          .toList();

      return _rotateByCategory(details, categoryId);
    } catch (e) {
      rethrow;
    }
  }

  // [VN] Lấy danh sách movie ranking
  Future<List<RankingMovieModel>> getRankingMovies() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));

      final String response = await rootBundle.loadString(
        'lib/app/data/dump/ranking_movies.json',
      );
      final List<dynamic> data = jsonDecode(response);
      final movies = data
          .map(
            (json) => RankingMovieModel.fromJson(
              json as Map<String, dynamic>,
              data.indexOf(json),
            ),
          )
          .toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }

  // [VN] Xoay vòng dữ liệu mock theo categoryId để mô phỏng API khác nhau mỗi tab
  List<T> _rotateByCategory<T>(List<T> items, int categoryId) {
    if (items.isEmpty) return items;
    final offset = (categoryId - 1) % items.length;
    return [...items.sublist(offset), ...items.sublist(0, offset)];
  }
}
