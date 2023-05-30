import 'package:http/http.dart' as http;

class RemoteDataSource {
  void onGetProduct() {
    Uri url = Uri.http("https://fakestoreapi.com/products");

    http.get(url).then((response) {
      if (response.statusCode == 200) {
      } else if (response.statusCode == 400) {}
    });
  }
}
