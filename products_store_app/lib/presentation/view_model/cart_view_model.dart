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

  final StreamController<List<Product>> _productsCartController =
      StreamController<List<Product>>.broadcast();

  final StreamController<double> _totalPriceController =
      StreamController<double>.broadcast();

  Stream<List<Product>> get cartStream => _productsCartController.stream;
  Stream<double> get totalPriceStream => _totalPriceController.stream;

  void addToCart(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
    } else {
      products.add(product);
    }

    _productsCartController.add(List<Product>.from(products));
    calculateTotalPrice();
  }

  void incrementQuantity(Product product) {
    final int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index].quantity += 1;
      _productsCartController.add(List<Product>.from(products));
      calculateTotalPrice();
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
      calculateTotalPrice();
    }
  }

  void calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var product in products) {
      totalPrice += product.subTotal;
    }
    _totalPriceController.add(totalPrice);
  }
}

final CartViewModel cartViewModel = CartViewModel();
