import 'dart:convert';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.image});

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
