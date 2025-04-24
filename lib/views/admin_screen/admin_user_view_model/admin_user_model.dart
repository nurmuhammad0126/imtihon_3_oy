import 'package:flutter_3_oy_imtixon/models/order_model.dart';

class AdminUserModel {
  final String userId;
  final String email;
  final String password;
  final String phone;
  final Map<String, dynamic> profile;
  final Map<String, dynamic> cart;
  final Map<String, OrderModel> orders;

  AdminUserModel({
    required this.userId,
    required this.email,
    required this.password,
    required this.phone,
    required this.profile,
    required this.cart,
    required this.orders,
  });

  factory AdminUserModel.fromJson(String id, Map<String, dynamic> json) {
    final ordersData = json['orders'] as Map<String, dynamic>? ?? {};
    final Map<String, OrderModel> parsedOrders = {};
    for (var entry in ordersData.entries) {
      parsedOrders[entry.key] = OrderModel.fromJson(
        id: entry.key,
        json: entry.value,
      );
    }

    return AdminUserModel(
      userId: id,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      profile: json['profile'] ?? {},
      cart: json['cart'] ?? {},
      orders: parsedOrders,
    );
  }
}
