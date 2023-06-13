import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/repository/get_product_by_category.dart';

import '../remote_data_source/prducts_by_category.dart';

class GetProductByCategoryRepositoryImpl
    extends GetProductsByCategoryRepository {
  final ProductByCategoryDataSource _productByCategoryDataSource;

  GetProductByCategoryRepositoryImpl(
      {ProductByCategoryDataSource? productByCategoryDataSource})
      : _productByCategoryDataSource =
            productByCategoryDataSource ?? ProductByCategoryDataSource();

  @override
  Future<List<Product>> onGetProductsByCategory(String category) async {
    return await onGetProductsByCategory(category);
  }
}
