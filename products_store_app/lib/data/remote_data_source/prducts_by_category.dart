import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_store_app/data/models/product_model.dart';

class ProductByCategoryDataSource {
  ProductByCategoryDataSource();

  Future<List<ProductModel>> onGetProductByCategories(String category) async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/category/$category');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body) as List;
      return responseJson.map((e) => ProductModel.fromMap(e)).toList();
    } else {
      return <ProductModel>[];
    }
  }
}
