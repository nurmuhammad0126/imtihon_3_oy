import 'package:flutter_3_oy_imtixon/models/review_model.dart';
import 'package:flutter_3_oy_imtixon/models/specification_model.dart';

class ProductModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final String image;
  final String description;

  final SpecificationModel? specifications;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
    required this.reviews,
    this.specifications,
  });

  factory ProductModel.fromJson({
    required Map<String, dynamic> json,
    required String id,
  }) {
    final spec = json['specifications'] != null
        ? SpecificationModel.fromJson(json['specifications'])
        : null;

    final reviewMap = json['reviews'] as Map<String, dynamic>? ?? {};
    final reviewList = reviewMap.entries
        .map((e) => ReviewModel.fromJson(id: e.key, json: e.value))
        .toList();
    return ProductModel(
      id: id,
      name: json["name"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      description: json["description"] ?? "",
      specifications: spec,
      reviews: reviewList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "category": category,
      "image": image,
      "description": description,
      if (specifications != null) 'specifications': specifications!.toJson(),
      'reviews': {
        for (var review in reviews) review.id: review.toJson(),
      },
    };
  }
}
