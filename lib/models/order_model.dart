import 'package:flutter_3_oy_imtixon/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final DateTime createdAt;
  final String deliveryAddress;
  final String paymentMethod;
  final String status;
  final double total;
  final List<CartItemModel>? products;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.deliveryAddress,
    required this.paymentMethod,
    this.products,
    required this.status,
    required this.total,
  });

  factory OrderModel.fromJson({
    required String id,
    required Map<String, dynamic> json,
  }) {
    final productMap = json["products"] as Map<String, dynamic>? ?? {};
    List<CartItemModel>? products;
    try {
      products = productMap.entries.map((entry) {
        return CartItemModel.fromJson(
          id: entry.key,
          json: entry.value,
        );
      }).toList();
    } catch (e) {
      print("Xato Prodcutsda: $e");
    }
    return OrderModel(
      id: id,
      createdAt: DateTime.tryParse(json["createdAt"] ?? "") ?? DateTime.now(),
      deliveryAddress: json["deliveryAddress"] ?? "",
      paymentMethod: json["paymentMethod"] ?? "",
      status: json["status"] ?? "pending",
      total: (json["total"] ?? 0).toDouble(),
      products: products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "createdAt": createdAt.toIso8601String(),
      "deliveryAddress": deliveryAddress,
      "paymentMethod": paymentMethod,
      "products": products != null?{
        for (var e in products!)
          if (e.productId != null) e.productId!: e.toJson(),
      }:{},
      "status": status,
      "total": total,
    };
  }
}
