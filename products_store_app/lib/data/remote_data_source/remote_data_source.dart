import 'package:http/http.dart' as http;

class RemoteDataSource {
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
