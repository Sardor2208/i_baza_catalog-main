class ProductModel {
  final int id;
  final String img;
  final String name;
  final String title;
  final String in_price;
  final String price;
  ProductModel({
    required this.name,
    required this.title,
    required this.in_price,
    required this.price,
    required this.id,

    required this.img,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      img: json['img'],
      name: json['name'],
      title: json['title'],
      in_price: json['in_price'],
      price: json['price'],
    );
  }

  @override
  String toString() {
    return 'CategoryModel{id: $id, img: $img, name: $name , title: $title , in_price: $in_price, price: $price}';
  }
  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.img == img && other.name == name && other.title == title && other.in_price == in_price && other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    img.hashCode ^
    name.hashCode^
    title.hashCode^
    in_price.hashCode^
    price.hashCode;
  }

  ProductModel copyWith({
    int? id,
    String? img,
    String? name,
    String? title,
    String? in_price,
    String? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      img: img ?? this.img,
      name: name ?? this.name,
      title: title ?? this.title,
      in_price: in_price ?? this.in_price,
      price: price ?? this.price,
    );
  }

}