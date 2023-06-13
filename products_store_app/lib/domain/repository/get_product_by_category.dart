import 'package:products_store_app/domain/entitis/products_entiti.dart';

abstract class GetProductsByCategoryRepository {
  Future<List<Product>> onGetProductsByCategory(String category);
}
