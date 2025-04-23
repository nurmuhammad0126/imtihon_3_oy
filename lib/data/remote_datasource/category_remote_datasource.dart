import 'dart:convert';
import 'package:flutter_3_oy_imtixon/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/categories";

  Future<List<CategoryModel>?> getCategories() async {
    final url = Uri.parse("$_baseUrl.json");

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != "null") {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return data.entries.map(
        (e) => CategoryModel.fromJson(e.value),
      ).toList();
    }

    return null;
  }

  Future<bool> addCategory(CategoryModel category) async {
    final url = Uri.parse("$_baseUrl.json");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(category.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteCategory(String categoryId) async {
    final url = Uri.parse("$_baseUrl/$categoryId.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }

  Future<bool> updateCategory(String categoryId, CategoryModel category) async {
    final url = Uri.parse("$_baseUrl/$categoryId.json");

    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(category.toJson()),
    );

    return response.statusCode == 200;
  }
}
