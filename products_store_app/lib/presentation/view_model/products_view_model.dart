import 'dart:async';

import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/use_cases/get_category_use_case.dart';
import 'package:products_store_app/presentation/interfaces/home_interface.dart';

import '../../domain/use_cases/get_product_by_category_use_case.dart';
import '../../domain/use_cases/get_product_use_case.dart';

class ProductsViewModel {
  List<Product> products = [];

  String _category = "";

  final GetProductsUseCase _getProductsUseCase;

  final GetCategoriesUseCase _categoriesUseCase;

  final GetProductByCategoryUseCase _getProductByCategoryUseCase;

  ProductsViewModel({
    GetProductsUseCase? getProductsUseCase,
    GetCategoriesUseCase? getCategoriesUseCase,
    GetProductByCategoryUseCase? getProductByCategoryUseCase,
  })  : _getProductsUseCase = getProductsUseCase ?? GetProductsUseCase(),
        _categoriesUseCase = getCategoriesUseCase ?? GetCategoriesUseCase(),
        _getProductByCategoryUseCase =
            getProductByCategoryUseCase ?? GetProductByCategoryUseCase();

  final StreamController<List<Product>> _productsController =
      StreamController<List<Product>>.broadcast()..add([]);

  Stream<List<Product>> get productsStream => _productsController.stream;

  final StreamController<List<String>> _categoriesController =
      StreamController<List<String>>.broadcast()..add([]);

  final StreamController<int> _indexController =
      StreamController<int>.broadcast()..add(0);

  Stream<List<String>> get categoryStrem => _categoriesController.stream;

  Stream<int> get indexStream => _indexController.stream;

  invokeProducts() async {
    products = await _getProductsUseCase.invokeGetProducts();
    _productsController.add(products);
  }

  invokeCategories() async {
    List<String> categories = await _categoriesUseCase.invokeGetCategories();
    _categoriesController.add(categories);
  }

  invokeGetProductsByCategory(String category) async {
    List<Product> products = await _getProductByCategoryUseCase
        .invokeGetProductsByCategory(category);
    _productsController.add(products);
  }

  setCategory(String category) {
    _category = category;
  }

  selectIndex(int index) {
    _indexController.add(index);
  }
}
