import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryDataSource {
  CategoryDataSource();

  Future<List<String>> onGetCategories() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products/categories');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responsejson = json.decode(response.body).cast<String>().toList();

      return responsejson;
    } else {
      return <String>[];
    }
  }
}
