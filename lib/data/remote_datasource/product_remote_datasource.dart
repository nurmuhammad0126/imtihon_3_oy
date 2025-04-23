import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/products";

  Future<List<ProductModel>?> getProduct() async {
    final url = Uri.parse("$_baseUrl.json");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data.entries
          .map(
            (e) => ProductModel.fromJson(json: e.value, id: e.key),
          )
          .toList();
    }

    return null;
  }

  Future<bool> addProduct(ProductModel product) async {
    final url = Uri.parse("$_baseUrl.json");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(product.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = Uri.parse("$_baseUrl/${product.id}.json");

    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(product.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteProduct(String productId) async {
    final url = Uri.parse("$_baseUrl/$productId.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }
}
