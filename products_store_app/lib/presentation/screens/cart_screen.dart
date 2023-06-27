import 'package:flutter/material.dart';

import '../../domain/entitis/products_entiti.dart';
import '../view_model/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Carrito de compras'),
      ),
      body: StreamBuilder<List<Product>>(
        stream: cartViewModel.cartStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final List<Product> products =
              snapshot.data ?? cartViewModel.products;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.network(product.image),
                          title: Text(product.title),
                          subtitle:
                              Text('\$${product.price.toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartViewModel.incrementQuantity(product);
                                },
                                icon: Icon(
                                  Icons.add_circle_rounded,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(product.quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  cartViewModel.decrementQuantity(product);
                                },
                                icon: Icon(
                                  Icons.remove_circle_rounded,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
