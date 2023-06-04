import 'package:flutter/material.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
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
              Text(
                "${product.price}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.add))
            ],
          ),
        ],
      ),
    );
  }
}
