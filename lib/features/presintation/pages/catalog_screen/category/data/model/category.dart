class CategoryModel {
  final int id;
  final String type;
  final String img;
  CategoryModel({
    required this.id,
    required this.type,
    required this.img,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      type: json['type'],
      img: json['img'],
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, type: $type, img: $img,}';
  }
  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    type.hashCode ^
    img.hashCode ;
  }

  CategoryModel copyWith({
    int? id,
    String? type,
    String? img,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      type: type ?? this.type,
      img: img ?? this.img,
    );
  }

}

// class ProductModel {}
