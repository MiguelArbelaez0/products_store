import 'package:products_store_app/data/remote_data_source/remote_data_source.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/repository/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final RemoteDataSource _remoteDataSource;

  ProductsRepositoryImpl({RemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? RemoteDataSource();

  @override
  Future<List<Product>> onGetProduct() async {
    return await _remoteDataSource.onGetProduct();
  }
}
