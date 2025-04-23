import 'package:flutter_3_oy_imtixon/models/simple_product_model.dart';

class CategoryModel {
  final String name;
  final String image;
  final List<SimpleProductModel> products;

  CategoryModel({
    required this.name,
    required this.image,
    required this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final productMap = json['products'] as Map<String, dynamic>? ?? {};
    final productList = productMap.entries
        .map((e) => SimpleProductModel.fromJson(e.key, e.value))
        .toList();
    return CategoryModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      products: productList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'products': {
        for (var product in products) product.id: product.toJson(),
      }
    };
  }
}
