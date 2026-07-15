class CategoryModel {
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  // [VN] Chuyển đổi từ JSON sang CategoryModel
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json['name']);
  }

  // [VN] Chuyển đổi từ CategoryModel sang JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
