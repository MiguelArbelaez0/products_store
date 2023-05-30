import 'package:products_store_app/domain/entitis/products_entiti.dart';

abstract class ProductsRepository {
  Future<List<Product>> onGetProduct();
}
