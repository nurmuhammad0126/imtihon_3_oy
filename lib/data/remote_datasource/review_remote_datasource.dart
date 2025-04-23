import 'dart:convert';
import 'package:flutter_3_oy_imtixon/models/review_model.dart';
import 'package:http/http.dart' as http;

class ReviewRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/products";

  Future<List<ReviewModel>?> getReviews(String productId) async {
    final url = Uri.parse("$_baseUrl/$productId/reviews.json");

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != "null") {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return data.entries.map(
        (e) => ReviewModel.fromJson(id: e.key, json: e.value),
      ).toList();
    }

    return null;
  }

  Future<bool> addReview(String productId, ReviewModel review) async {
    final url = Uri.parse("$_baseUrl/$productId/reviews.json");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(review.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteReview(String productId, String reviewId) async {
    final url = Uri.parse("$_baseUrl/$productId/reviews/$reviewId.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }
}
