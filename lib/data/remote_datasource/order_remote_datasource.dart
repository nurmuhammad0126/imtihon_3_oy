import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users";

  Future<List<OrderModel>?> getOrders(String userId) async {
    final url = Uri.parse("$_baseUrl/$userId/orders.json");

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != "null") {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data.entries
          .map(
            (e) => OrderModel.fromJson(id: e.key, json: e.value),
          )
          .toList();
    }

    return null;
  }

  Future<bool> addOrder(String userId, OrderModel order) async {
    final url = Uri.parse("$_baseUrl/$userId/orders.json");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(order.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteOrder(String userId, String orderId) async {
    final url = Uri.parse("$_baseUrl/$userId/orders/$orderId.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }

  Future<bool> updateOrder(String userID, OrderModel order) async {
    final url = Uri.parse("$_baseUrl/$userID/orders/${order.id}.json");

    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(order.toJson()),
    );

    return response.statusCode == 200;
  }
}
