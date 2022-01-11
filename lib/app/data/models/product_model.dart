// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

class Product {
  Product({
    this.id,
    this.title,
    this.type,
    this.description,
    this.filename,
    this.height,
    this.width,
    this.price,
    this.rating,
  });
  final dynamic id;
  final String? title;
  final String? type;
  final String? description;
  final String? filename;
  final String? height;
  final String? width;
  final String? price;
  final String? rating;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        type: json["type"],
        description: json["description"],
        filename: json["filename"],
        height: json["height"],
        width: json["width"],
        price: json["price"].toDouble(),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
        "description": description,
        "filename": filename,
        "height": height,
        "width": width,
        "price": price,
        "rating": rating,
      };
}
