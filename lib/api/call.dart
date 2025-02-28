import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/api/product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<Products> products = [];
  bool isLoading = false;

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      var url = Uri.parse('https://api.sampleapis.com/avatar/characters');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        products = data.map((json) => Products.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
