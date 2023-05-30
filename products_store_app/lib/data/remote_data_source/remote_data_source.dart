import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_store_app/data/models/product_model.dart';

class RemoteDataSource {
  RemoteDataSource();
  Future<List<ProductModel>> onGetProduct() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responsejson = json.decode(response.body) as List;
      return responsejson.map((e) => ProductModel.fromMap(e)).toList();
    } else {
      return <ProductModel>[];
    }
  }
}
