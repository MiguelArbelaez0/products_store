import 'dart:async';

import '../../domain/entitis/products_entiti.dart';

class CartViewModel {
  List<Product> products = [];

  final StreamController<List<Product>> _productsCartController =
      StreamController<List<Product>>.broadcast();

  Stream<List<Product>> get cartStream => _productsCartController.stream;

  void addToCart(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
    } else {
      products.add(product);
    }

    _productsCartController.add(List<Product>.from(products));
  }
}

final CartViewModel cartViewModel = CartViewModel();
