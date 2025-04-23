class CartItemModel {
  final String? productId;
  final String? productName;
  final double? productPrice;
  final int? quantity;

  CartItemModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });

  factory CartItemModel.fromJson({
    required Map<String, dynamic> json,
    required String id,
  }) {
    return CartItemModel(
      productId: id,
      productName: json["productName"] ?? "",
      productPrice: (json["productPrice"] ?? 0).toDouble(),
      quantity: json["quantity"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "productId": productId,
      "productPrice": productPrice,
      "quantity": quantity,
    };
  }
}
