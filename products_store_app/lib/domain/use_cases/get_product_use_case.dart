import 'package:products_store_app/data/repository_impl/impl_repositori.dart';
import 'package:products_store_app/domain/repository/products_repository.dart';

import '../entitis/products_entiti.dart';

class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase({ProductsRepository? productsRepository})
      : _productsRepository = productsRepository ?? ProductsRepositoryImpl();

  Future<List<Product>> invokeGetProducts() async {
    return _productsRepository.onGetProduct();
  }
}
