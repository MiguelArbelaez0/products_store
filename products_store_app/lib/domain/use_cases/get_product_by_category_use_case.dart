import 'package:products_store_app/data/repository_impl/get_product_by_category_impl_respository.dart';

import '../entitis/products_entiti.dart';
import '../repository/get_product_by_category.dart';

class GetProductByCategoryUseCase {
  final GetProductsByCategoryRepository _getProductsByCategoryRepository;

  GetProductByCategoryUseCase(
      {GetProductsByCategoryRepository? getProductsByCategoryRepository})
      : _getProductsByCategoryRepository = getProductsByCategoryRepository ??
            GetProductByCategoryRepositoryImpl();

  Future<List<Product>> invokeGetProductsByCategory(String category) async {
    return await _getProductsByCategoryRepository
        .onGetProductsByCategory(category);
  }
}
