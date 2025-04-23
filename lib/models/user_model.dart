import 'package:flutter_3_oy_imtixon/models/cart_item_model.dart';
import 'package:flutter_3_oy_imtixon/models/order_model.dart';
import 'package:flutter_3_oy_imtixon/models/user_profile_model.dart';

class UserModel {
  final String id;
  final String email;
  final String phone;
  final String password;
  final List<CartItemModel>? cart;
  final List<OrderModel>? orders;
  final UserProfileModel profile;

  UserModel({
    required this.password,
    required this.id,
    required this.email,
    required this.phone,
    this.cart,
    this.orders,
    required this.profile,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    final cartMap = json["cart"] as Map<String, dynamic>? ?? {};
    final orderMap = json["orders"] as Map<String, dynamic>? ?? {};

    final cartData = cartMap.entries
        .map(
          (e) => CartItemModel.fromJson(id: e.key, json: e.value),
        )
        .toList();
    final orderData = orderMap.entries
        .map(
          (e) => OrderModel.fromJson(id: e.key, json: e.value),
        )
        .toList();

    return UserModel(
        id: id,
        password: json["password"].toString(),
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        cart: cartData,
        orders: orderData,
        profile: UserProfileModel.fromJson(json["profile"] ?? {}));
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'password': password.toString(),
      'cart': cart != null
          ? {
              for (var item in cart!) item.productId: item.toJson(),
            }
          : {},
      'orders': orders != null
          ? {
              for (var order in orders!) order.id: order.toJson(),
            }
          : {},
      'profile': profile.toJson(),
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    String? password,
    List<CartItemModel>? cart,
    List<OrderModel>? orders,
    UserProfileModel? profile,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      cart: cart ?? this.cart,
      orders: orders ?? this.orders,
      profile: profile ?? this.profile,
    );
  }


}
