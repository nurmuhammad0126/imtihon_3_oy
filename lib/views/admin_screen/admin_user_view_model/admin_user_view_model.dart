import 'dart:convert';
import 'package:flutter_3_oy_imtixon/views/admin_screen/admin_user_view_model/admin_user_model.dart';
import 'package:http/http.dart' as http;


class AdminUserViewModel {
  final String baseUrl =
      'https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users';


  Future<List<AdminUserModel>> getAllUsers() async {
    final url = Uri.parse('$baseUrl.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<AdminUserModel> users = [];
        if (data != null) {
          data.forEach((key, value) {
            users.add(AdminUserModel.fromJson(key, value));
          });
        }
        return users;
      } else {
        print('Failed to load users: ${response.body}');
      }
    } catch (e) {
      print('Exception in getAllUsers: $e');
    }
    return [];
  }


  Future<void> deleteUser(String userId) async {
    final url = Uri.parse('$baseUrl/$userId.json');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        print('User deleted successfully');
      } else {
        print('Failed to delete user: ${response.body}');
      }
    } catch (e) {
      print('Exception in deleteUser: $e');
    }
  }


  Future<void> updateOrderStatus({
    required String userId,
    required String orderId,
    required String newStatus,
  }) async {
    final url = Uri.parse('$baseUrl/$userId/orders/$orderId/status.json');
    try {
      final response = await http.put(
        url,
        body: jsonEncode(newStatus),
      );
      if (response.statusCode == 200) {
        print('Order status updated successfully');
      } else {
        print('Failed to update order status: ${response.body}');
      }
    } catch (e) {
      print('Exception in updateOrderStatus: $e');
    }
  }
}
