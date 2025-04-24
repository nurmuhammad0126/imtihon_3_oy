class CartItemModel {
  final String? productId;
  final String? productName;
  final double? productPrice;
  final int? quantity;
  final String? image;

  CartItemModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.image,
  });

  CartItemModel copyWith({
    String? productId,
    String? productName,
    double? productPrice,
    int? quantity,
    String? image,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }

  factory CartItemModel.fromJson({
    required Map<String, dynamic> json,
    required String id,
  }) {
    return CartItemModel(
      image: json["image"],
      productId: id,
      productName: json["productName"] ?? "",
      productPrice: (json["productPrice"] ?? 0).toDouble(),
      quantity: json["quantity"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "productName": productName,
      "productId": productId,
      "productPrice": productPrice,
      "quantity": quantity,
    };
  }
}
