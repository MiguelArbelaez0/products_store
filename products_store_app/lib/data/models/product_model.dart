import 'dart:convert';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.quantity,
      required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.image});

  String toJson() => json.encode(toMap());
  factory ProductModel.fromMap(Map<String, dynamic> json) {
    final int? quantity = json["quantity"];
    return ProductModel(
      quantity: quantity ?? 0, // Asignar 0 si el valor es nulo
      id: json["id"],
      title: json["title"],
      price: double.parse(json["price"].toString()),
      description: json["description"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toMap() => {
        "quantity": quantity,
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
