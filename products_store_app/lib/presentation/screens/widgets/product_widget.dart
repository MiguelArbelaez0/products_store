import 'package:flutter/material.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class ProductWidget extends StatelessWidget {
  final IconButton iconButton;

  final Product product;

  const ProductWidget({
    super.key,
    required this.product,
    required this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 6,
                      blurRadius: 5,
                      offset: Offset(0, 20),
                    )
                  ],
                ),
                child: Image.network(
                  product.image,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                product.title,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "\$${product.price}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: iconButton,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
