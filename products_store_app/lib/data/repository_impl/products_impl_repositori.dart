import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/repository/products_repository.dart';

import '../remote_data_source/prdoucts_data_source.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDataSource _productsDataSource;

  ProductsRepositoryImpl({ProductsDataSource? productsDataSource})
      : _productsDataSource = productsDataSource ?? ProductsDataSource();

  @override
  Future<List<Product>> onGetProduct() async {
    return await _productsDataSource.onGetProduct();
  }
}
