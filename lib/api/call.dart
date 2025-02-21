import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_app/api/product_model.dart';

Future<List<Products>> fetchProducts() async {
  var url = Uri.parse('https://dummyjson.com/products');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    List<dynamic> productsJson = jsonResponse['products'];
    return productsJson.map((json) => Products.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
