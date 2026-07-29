import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wetv/app/data/models/category_model.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';

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
}
