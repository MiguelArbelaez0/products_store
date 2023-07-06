import 'dart:async';

import '../../domain/entitis/products_entiti.dart';

// class CartViewModel {
//   List<Product> products = [];

//   final StreamController<List<Product>> _productsCartController =
//       StreamController<List<Product>>.broadcast();

//   Stream<List<Product>> get cartStream => _productsCartController.stream;

//   void addToCart(Product product) {
//     final int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       products[index].quantity += 1;
//     } else {
//       products.add(product);
//     }

//     _productsCartController.add(List<Product>.from(products));
//   }

//   void incrementQuantity(Product product) {
//     final int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       products[index].quantity += 1;
//       _productsCartController.add(List<Product>.from(products));
//     }
//   }

//   void decrementQuantity(Product product) {
//     final int index = products.indexWhere((p) => p.id == product.id);
//     if (index != -1) {
//       products[index].quantity -= 1;
//       if (products[index].quantity == 0) {
//         products.removeAt(index);
//       }
//       _productsCartController.add(List<Product>.from(products));
//     }
//   }
// }
class CartViewModel {
  List<Product> products = [];
  double total = 0;
  final StreamController<List<Product>> _productsCartController =
      StreamController<List<Product>>.broadcast();

  final StreamController<double> _totalItemsController =
      StreamController<double>.broadcast();

  Stream<List<Product>> get cartStream => _productsCartController.stream;
  Stream<double> get totalItemsStream => _totalItemsController.stream;

  void addToCart(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
    } else {
      products.add(product);
    }

    _productsCartController.add(List<Product>.from(products));
    _updateTotalItems();
  }

  void incrementQuantity(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
      _productsCartController.add(List<Product>.from(products));
      _updateTotalItems();
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
      _updateTotalItems();
    }
  }

  void _updateTotalItems() {
    for (var product in products) {
      total += product.quantity;
    }
    _totalItemsController.add(total);
  }
}

final CartViewModel cartViewModel = CartViewModel();
