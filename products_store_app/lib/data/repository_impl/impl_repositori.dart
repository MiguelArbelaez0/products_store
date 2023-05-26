import 'package:products_store_app/data/remote_data_source/remote_data_source.dart';
import 'package:products_store_app/domain/repository/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final RemoteDataSource _remoteDataSource;

  ProductsRepositoryImpl({this._remoteDataSource});

  @override
  void onGetProduct() {
    // TODO: implement onGetProduct
    _remoteDataSource.onGetProduct();
  }
}
