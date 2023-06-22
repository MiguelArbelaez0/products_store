import 'package:flutter/material.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Descripcion "),
      ),
      body: ListTile(
        leading: Image.network(product.image),
        title: Text(product.title),
        subtitle: Text('\$${product.price}'),
      ),
    );
  }
}
