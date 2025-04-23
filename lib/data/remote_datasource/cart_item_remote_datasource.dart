import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/cart_item_model.dart';
import 'package:http/http.dart' as http;

class CartItemRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users";

  Future<List<CartItemModel>?> getCartItems(String userId) async {
  try {
    final url = Uri.parse("$_baseUrl/$userId/cart.json");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body == "null" || response.body.isEmpty) {
        return [];
      }
      
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return data.entries
          .map(
            (e) => CartItemModel.fromJson(id: e.key, json: e.value),
          )
          .toList();
    } else {
      print("Failed to load cart items: ${response.statusCode}");
    }
  } catch (e) {
    print("Error in fetching cart items: $e");
  }
  return null;
}


  Future<bool> addCartItem(String userId, CartItemModel cartItem) async {
    final url = Uri.parse("$_baseUrl/$userId/cart.json");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cartItem.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> removeCartItem(String userId, String productId) async {
    final url = Uri.parse("$_baseUrl/$userId/cart/$productId.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }

  Future<bool> clearCart(String userId) async {
    final url = Uri.parse("$_baseUrl/$userId/cart.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }
}
