// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class product_model {
  int id;
  String title;
  String description;
  num price;
  String thumbnail;
  product_model({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  product_model copyWith({
    int? id,
    String? title,
    String? description,
    num? price,
    String? thumbnail,
  }) {
    return product_model(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'thumbnail': thumbnail,
    };
  }

  factory product_model.fromMap(Map<String, dynamic> map) {
    return product_model(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory product_model.fromJson(String source) =>
      product_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'product_model(id: $id, title: $title, description: $description, price: $price, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant product_model other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.price == price &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      thumbnail.hashCode;
  }
}
