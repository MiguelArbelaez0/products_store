import 'package:flutter/material.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  product.image,
                  // width: 200,
                  // height: 400,
                  // fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                product.title,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
