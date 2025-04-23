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

  factory CartItemModel.fromJson(
      {required String productId, required Map<String, dynamic> json}) {
    return CartItemModel(
      productId: productId,
      productName: json["productName"] ?? "",
      productPrice: (json["productPrice"] ?? 0).toDouble(),
      quantity: json["quantity"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "productId": productId,
      "quantity": quantity,
    };
  }
}
