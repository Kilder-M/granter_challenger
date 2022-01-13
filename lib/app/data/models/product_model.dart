import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

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
  dynamic id;
  String? title;
  String? type;
  String? description;
  String? filename;
  String? height;
  String? width;
  String? price;
  String? rating;

  factory Product.fromRawJson(String str) => Product.fromDoc(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory Product.fromDoc(QueryDocumentSnapshot<Object?> doc) => Product(
        id: doc.reference.id.toString(),
        filename: doc['filename'],
        title: doc['title'],
        description: doc['description'],
        height: doc['height'],
        price: doc['price'],
        type: doc['type'],
        rating: doc['rating'],
        width: doc['width'],
      );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "type": type,
//         "description": description,
//         "filename": filename,
//         "height": height,
//         "width": width,
//         "price": price,
//         "rating": rating,
//       };
}
