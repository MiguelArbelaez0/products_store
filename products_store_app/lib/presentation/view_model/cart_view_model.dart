import 'dart:async';

import '../../domain/entitis/products_entiti.dart';

class CartViewModel {
  List<Product> products = [];

  final StreamController<List<Product>> _productsCartController =
      StreamController<List<Product>>.broadcast();

  final StreamController<double> _totalController =
      StreamController<double>.broadcast();

  Stream<List<Product>> get cartStream => _productsCartController.stream;

  Stream<double> get totalStream => _totalController.stream;

  void addToCart(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
    } else {
      product.quantity = 1;
      products.add(product);
    }

    _productsCartController.add(List<Product>.from(products));
    _totalItem();
  }

  void incrementQuantity(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
      _productsCartController.add(List<Product>.from(products));
      _totalItem();
    }
  }

  void decrementQuantity(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity -= 1;
      if (products[index].quantity == 0) {
        products.removeAt(index);
      }
      _productsCartController.add(List<Product>.from(products));
      _totalItem();
    }
  }

  void _totalItem() {
    double total = 0;
    for (Product product in products) {
      total += product.subTotal;
    }
    _totalController.add(total);
  }
}

final CartViewModel cartViewModel = CartViewModel();
