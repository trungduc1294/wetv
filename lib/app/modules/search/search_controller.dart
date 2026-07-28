import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/data/models/top_search_item_model.dart';
import 'package:wetv/app/routes/app_routes.dart';

// [VN] Controller màn Search
class SearchPageController extends GetxController {
  final query = ''.obs;
  final history = <String>[].obs;
  final topSearches = <TopSearchItemModel>[].obs;

  late final TextEditingController textController;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
    textController.addListener(() {
      query.value = textController.text;
    });
    _loadSampleData();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  // [VN] Dữ liệu mẫu preview UI
  void _loadSampleData() {
    history.assignAll(['About Love']);

    const poster =
        'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350';
    const thumb = 'https://picsum.photos/seed/search';

    topSearches.assignAll([
      TopSearchItemModel(
        id: '1',
        title: 'Bách Hoa Sát',
        thumbnailUrl: '${thumb}1/400/240',
        meta: 'Trung Quốc đại lục · Phim truyền hình',
        tags: const ['Tình yêu', 'Phục trang cổ đại'],
      ),
      TopSearchItemModel(
        id: '2',
        title: 'Giây Phút Vượt Quá Giới Hạn',
        thumbnailUrl: '${thumb}2/400/240',
        meta: 'Hàn Quốc · Phim truyền hình',
        tags: const ['Tình yêu', 'Thành phố'],
      ),
      const TopSearchItemModel(
        id: '3',
        title: 'Mạc Ly',
        thumbnailUrl: poster,
        meta: 'Trung Quốc đại lục · Phim truyền hình',
        tags: ['Lãng mạn', 'Hiện đại'],
      ),
      TopSearchItemModel(
        id: '4',
        title: 'Tinh Hà Xán Lạn',
        thumbnailUrl: '${thumb}4/400/240',
        meta: 'Trung Quốc đại lục · Phim truyền hình',
        tags: const ['Cổ trang', 'Kỳ ảo'],
      ),
      TopSearchItemModel(
        id: '5',
        title: 'Tình Yêu Có Pháo Hoa',
        thumbnailUrl: '${thumb}5/400/240',
        meta: 'Trung Quốc đại lục · Phim truyền hình',
        tags: const ['Tình cảm'],
      ),
    ]);
  }

  void onCancel() => Get.back();

  // [VN] Chọn chip lịch sử — điền vào ô search
  void onHistoryTap(String keyword) {
    textController.text = keyword;
    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: keyword.length),
    );
    query.value = keyword;
  }

  void clearHistory() {
    history.clear();
  }

  void onSubmit(String value) {
    final keyword = value.trim();
    if (keyword.isEmpty) return;
    if (!history.contains(keyword)) {
      history.insert(0, keyword);
    }
  }

  void onTopSearchTap(TopSearchItemModel item) {
    Get.toNamed(AppRoutes.MOVIE_DETAIL);
  }
}
