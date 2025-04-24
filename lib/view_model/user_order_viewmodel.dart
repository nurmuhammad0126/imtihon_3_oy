import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/order_model.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart'
    show UserViewmodel;

import 'package:http/http.dart' as http;

class UserOrderViewmodel {
  UserOrderViewmodel._internal();

  static final UserOrderViewmodel _instance = UserOrderViewmodel._internal();
  factory UserOrderViewmodel() => _instance;

  final userViewmodel = UserViewmodel();

  final _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users";

  Future<void> addUserOrder() async {
    if (userViewmodel.userGlobal != null &&
        userViewmodel.userGlobal!.cart != null &&
        userViewmodel.userGlobal!.cart!.isNotEmpty) {
      if (userViewmodel.userGlobal!.orders == null) {
        userViewmodel.userGlobal =
            userViewmodel.userGlobal!.copyWith(orders: []);
      }
      double totalPrice = 0;
      for (var item in userViewmodel.userGlobal!.cart!) {
        totalPrice += (item.productPrice ?? 0) * (item.quantity ?? 1);
      }
      final newOrder = OrderModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt: DateTime.now(),
        deliveryAddress: "Madrid",
        paymentMethod: "Cash",
        status: "pending",
        total: totalPrice,
        products: userViewmodel.userGlobal!.cart,
      );
      userViewmodel.userGlobal!.orders!.add(newOrder);
      userViewmodel.userGlobal = userViewmodel.userGlobal!.copyWith(cart: []);
      final url = Uri.parse("$_baseUrl/${userViewmodel.userGlobal!.id}.json");
      final encodedData = userViewmodel.userGlobal!.toJson();
      await http.patch(url, body: jsonEncode(encodedData));
    }
  }
}
