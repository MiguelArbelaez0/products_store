import 'package:flutter/material.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              product.image,
              width: 200,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          Text(product.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${product.price}"),
              IconButton(onPressed: () {}, icon: Icon(Icons.add))
            ],
          ),
        ],
      ),
    );
  }
}
