import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_app/api/product_model.dart';

Future<List<Products>> fetchProducts() async {
  var url = Uri.parse('https://api.sampleapis.com/avatar/characters');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    // List<dynamic> productsJson = jsonResponse['products'];
    return data.map((json) => Products.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
