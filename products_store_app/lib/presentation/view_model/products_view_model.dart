import 'dart:async';

import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/use_cases/get_category_use_case.dart';

import '../../domain/use_cases/get_product_use_case.dart';

class ProductsViewModel {
  List<Product> products = [];

  final GetProductsUseCase _getProductsUseCase;

  final GetCategoriesUseCase _categoriesUseCase;

  ProductsViewModel(
      {GetProductsUseCase? getProductsUseCase,
      GetCategoriesUseCase? getCategoriesUseCase})
      : _getProductsUseCase = getProductsUseCase ?? GetProductsUseCase(),
        _categoriesUseCase = getCategoriesUseCase ?? GetCategoriesUseCase();

  final StreamController<List<Product>> _productsController =
      StreamController<List<Product>>.broadcast()..add([]);

  Stream<List<Product>> get productsStream => _productsController.stream;

  final StreamController<List<String>> _categoriesController =
      StreamController<List<String>>.broadcast()..add([]);

  Stream<List<String>> get categoryStrem => _categoriesController.stream;

  invokeProducts() async {
    products = await _getProductsUseCase.invokeGetProducts();
    _productsController.add(products);
  }

  invokeCategories() async {
    List<String> categories = await _categoriesUseCase.invokeGetCategories();
    _categoriesController.add(categories);
  }
}
