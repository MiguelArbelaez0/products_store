import 'package:products_store_app/data/repository_impl/impl_repositori.dart';
import 'package:products_store_app/domain/repository/products_repository.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource extends ProductsRepository {
  late final ProductsRepositoryImpl productsRepositoryImpl;

  @override
  Future<void> onGetProduct() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');

    http.Response response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
    } else if (response.statusCode == 400) {
    } else {}
  }
}
