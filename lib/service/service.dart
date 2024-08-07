import 'package:e_commerce/login/welcome_screen.dart';
import 'package:e_commerce/api/items_model.dart';
import 'package:http/http.dart' as http;

class remoteService {
  static var client = http.Client();

  static Future<List<Products>?> fetchproduct() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      print('Error response: ${response.body}');
    }

    return null;
  }
}
