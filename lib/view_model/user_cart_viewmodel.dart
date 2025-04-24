import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/cart_item_model.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart'
    show UserViewmodel;

import 'package:http/http.dart' as http;

class UserCartViewmodel {
  UserCartViewmodel._internal();

  static final UserCartViewmodel _instance = UserCartViewmodel._internal();
  factory UserCartViewmodel() => _instance;

  final userViewmodel = UserViewmodel();

  final _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users";

  Future<bool?> addUserCart(CartItemModel cartItem) async {
    if (userViewmodel.userGlobal != null) {
      if (userViewmodel.userGlobal!.cart == null) {
        userViewmodel.userGlobal =
            userViewmodel.userGlobal!.copyWith(cart: [cartItem]);
        return true;
      } else {
        userViewmodel.userGlobal!.cart!.add(cartItem);
      }

      final url = Uri.parse("$_baseUrl/${userViewmodel.userGlobal!.id}.json");

      final encodedData = userViewmodel.userGlobal!.toJson();

      await http.patch(url, body: jsonEncode(encodedData));
      return true;
    }
    return false;
  }

  Future<void> updateCartQuantity(
    CartItemModel cartItem,
    int newQuantity,
  ) async {
    List<CartItemModel>? newCart = [];

    if (userViewmodel.userGlobal != null) {
      if (userViewmodel.userGlobal?.cart != null) {
        newCart = userViewmodel.userGlobal!.cart;

        int index = newCart!.indexWhere(
          (e) => e.productId == cartItem.productId,
        );

        newCart[index] = cartItem.copyWith(quantity: newQuantity);

        userViewmodel.userGlobal =
            userViewmodel.userGlobal!.copyWith(cart: newCart);

        final url = Uri.parse("$_baseUrl/${userViewmodel.userGlobal!.id}.json");

        final encodedData = userViewmodel.userGlobal!.toJson();

        await http.patch(url, body: jsonEncode(encodedData));
      }
    }
  }
}
