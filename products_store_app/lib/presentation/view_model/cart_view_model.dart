import 'dart:async';

import '../../domain/entitis/products_entiti.dart';

class CartViewModel {
  List<Product> products = [];

  final StreamController<List<Product>> _productsCartController =
      StreamController<List<Product>>.broadcast()..add([]);

  Stream<List<Product>> get cartStream => _productsCartController.stream;

  void addToCart(Product product) {
    products.add(product);
    _productsCartController.add(products);
  }
}

final CartViewModel cartViewModel = CartViewModel();
