import 'dart:async';

import 'package:products_store_app/domain/entitis/products_entiti.dart';

import '../../domain/use_cases/get_product_use_case.dart';

class ProductsViewModel {
  List<Product> products = [];
  final GetProductsUseCase _getProductsUseCase;

  ProductsViewModel({GetProductsUseCase? getProductsUseCase})
      : _getProductsUseCase = getProductsUseCase ?? GetProductsUseCase();

  final StreamController<List<Product>> _productsController =
      StreamController<List<Product>>.broadcast()..add([]);

  Stream<List<Product>> get productsStream => _productsController.stream;

  invokeProducts() async {
    products = await _getProductsUseCase.invokeGetProducts();
    _productsController.add(products);
  }
}
