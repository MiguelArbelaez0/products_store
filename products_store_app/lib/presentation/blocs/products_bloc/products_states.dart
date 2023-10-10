import '../../../domain/entitis/products_entiti.dart';

abstract class ProductsStates {
  final ModelData modelData;

  ProductsStates(this.modelData);
}

class NormalState extends ProductsStates {
  NormalState(super.modelData);
}

class ShowLoadingState extends ProductsStates {
  ShowLoadingState(super.modelData);
}

class ModelData {
  final List<Product>? products;
  final List<String>? categories;
  final String? category;
  final int? selectIndex;
  ModelData({this.products, this.categories, this.category, this.selectIndex});

  ModelData copyWith(
          {List<Product>? products,
          List<String>? categories,
          String? category,
          int? selectIndex}) =>
      ModelData(
        products: products ?? this.products,
        categories: categories ?? this.categories,
        category: category ?? this.category,
        selectIndex: selectIndex ?? this.selectIndex,
      );
}
