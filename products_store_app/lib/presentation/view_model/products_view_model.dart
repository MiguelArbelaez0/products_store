import 'dart:async';

import 'package:products_store_app/domain/entitis/products_entiti.dart';

import '../../domain/use_cases/get_product_use_case.dart';

// class ProductsViewModel {
//   final GetProductsUseCase _getProductsUseCase;

//   ProductsViewModel({GetProductsUseCase? getProductsUseCase})
//       : _getProductsUseCase = getProductsUseCase ?? GetProductsUseCase();

//   final StreamController<List<Product>> _productsController =
//       StreamController<List<Product>>.broadcast();

//   Stream<List<Product>> get productsStream => _productsController.stream;

//   invokeProducts() async {
//     await _getProductsUseCase.invokeGetProducts();
//   }
// }

class ProductsViewModel {
  List<Product> products = [];
  final GetProductsUseCase _getProductsUseCase;

  ProductsViewModel({GetProductsUseCase? getProductsUseCase})
      : _getProductsUseCase = getProductsUseCase ?? GetProductsUseCase();

  final StreamController<List<Product>> _productsController =
      StreamController<List<Product>>.broadcast();

  Stream<List<Product>> get productsStream => _productsController.stream;

  invokeProducts() async {
    await _getProductsUseCase.invokeGetProducts();
  }
}
