import 'package:products_store_app/data/remote_data_source/remote_data_source.dart';
import 'package:products_store_app/domain/repository/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final RemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  void onGetProduct() {
    remoteDataSource.onGetProduct();
  }
}
