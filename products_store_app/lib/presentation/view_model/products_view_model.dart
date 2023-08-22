import 'dart:async';

import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/use_cases/get_category_use_case.dart';
import 'package:products_store_app/presentation/interfaces/home_interface.dart';

import '../../domain/use_cases/get_product_by_category_use_case.dart';
import '../../domain/use_cases/get_product_use_case.dart';

class ArgsProductVieModel {
  final GetProductsUseCase _getProductsUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductByCategoryUseCase _getProductByCategoryUseCase;
  ArgsProductVieModel(
      {GetCategoriesUseCase? getCategoriesUseCaseTest,
      GetProductsUseCase? getProductsUseCaseTest,
      GetProductByCategoryUseCase? getProductByCategoryUseCaseTest,
      GetCategoriesUseCase? getCategoriesUseCase})
      : _getCategoriesUseCase =
            getCategoriesUseCaseTest ?? GetCategoriesUseCase(),
        _getProductsUseCase = getProductsUseCaseTest ?? GetProductsUseCase(),
        _getProductByCategoryUseCase =
            getProductByCategoryUseCaseTest = GetProductByCategoryUseCase();
}

class ProductsViewModel {
  List<Product> products = [];

  String _category = "";

  final ArgsProductVieModel _argsProductVieModel;

  final HomeInterface _homeInterface;

  ProductsViewModel(this._homeInterface, this._argsProductVieModel);

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
    _homeInterface.showLoading();
    products =
        await _argsProductVieModel._getProductsUseCase.invokeGetProducts();
    _productsController.add(products);
    _homeInterface.hideLoading();
  }

  invokeCategories() async {
    _homeInterface.showLoading();
    List<String> categories =
        await _argsProductVieModel._getCategoriesUseCase.invokeGetCategories();
    _categoriesController.add(categories);
    _homeInterface.hideLoading();
  }

  invokeGetProductsByCategory(String category) async {
    _homeInterface.showLoading();
    List<Product> products = await _argsProductVieModel
        ._getProductByCategoryUseCase
        .invokeGetProductsByCategory(category);
    _productsController.add(products);
    _homeInterface.hideLoading();
  }

  setCategory(String category) {
    _category = category;
  }

  selectIndex(int index) async {
    _indexController.add(index);
  }
}
