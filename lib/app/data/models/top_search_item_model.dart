// [VN] Model item trong danh sách tìm kiếm hàng đầu
class TopSearchItemModel {
  const TopSearchItemModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    this.meta = '',
    this.tags = const [],
  });

  final String id;
  final String title;
  final String thumbnailUrl;
  // [VN] Dòng meta: quốc gia · thể loại
  final String meta;
  final List<String> tags;
}
