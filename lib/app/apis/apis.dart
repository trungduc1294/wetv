import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wetv/app/data/models/category_model.dart';
import 'package:wetv/app/data/models/movie_detail_model.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';
import 'package:wetv/app/data/models/movie_model.dart';

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
  // [VN] Lấy danh sách movie hero slide từ API
  Future<List<MovieHeroSlide>> getMovieHeroSlides() async {
    try {
      // [VN] Delay để mô phỏng API
      await Future.delayed(const Duration(milliseconds: 200));

      // [VN] Đọc danh sách movie hero slide từ file dump JSON
      final String response = await rootBundle.loadString(
        'lib/app/data/dump/movie_hero_slide.json',
      );
      final List<dynamic> data = jsonDecode(response);
      return data
          .map((json) => MovieHeroSlide.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // [VN] Lấy danh sách movie list từ API
  Future<List<MovieModel>> getMovieList() async {
    try {
      // [VN] Delay để mô phỏng API
      await Future.delayed(const Duration(milliseconds: 200));

      // [VN] Đọc danh sách movie list từ file dump JSON
      final String response = await rootBundle.loadString(
        'lib/app/data/dump/movie_list.json',
      );
      final List<dynamic> data = jsonDecode(response);
      return data
          .map(
            (json) => MovieModel.fromJson(
              json as Map<String, dynamic>,
              data.indexOf(json),
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // [VN] Lấy thông tin danh sách film chi tiết
  Future<List<MovieDetailInfo>> getMovieListDetailInfo() async {
    try {
      // [VN] Delay để mô phỏng API
      await Future.delayed(const Duration(milliseconds: 200));

      // [VN] Đọc thông tin danh sách film chi tiết từ file dump JSON
      final String response = await rootBundle.loadString(
        'lib/app/data/dump/movie_list_detail_info.json',
      );
      final List<dynamic> data = jsonDecode(response);
      return data
          .map((json) => MovieDetailInfo.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
