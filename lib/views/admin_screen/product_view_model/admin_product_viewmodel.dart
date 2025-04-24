import 'dart:convert';
import 'package:http/http.dart' as http;

class AdminProductViewmodel {
  final baseUrl = 'https://exam3-85adf-default-rtdb.firebaseio.com/exam3';

  Future<void> addProduct({
    required String categoryId,
    required String name,
    required String image,
    required double price,
    required String color,
    required String gender,
    required int count,
    required double rating,
    required String description,
    required Map<String, dynamic> specifications,
  }) async {
    final productId = DateTime.now().millisecondsSinceEpoch.toString();

    final productData = {
      'name': name,
      'image': image,
      'price': price,
      'color': color,
      'gender': gender,
      'count': count,
      'rating': rating,
    };

    final fullProductData = {
      'name': name,
      'image': image,
      'price': price,
      'category': categoryId,
      'description': description,
      'specifications': specifications,
    };

    final categoryUrl =
        Uri.parse('$baseUrl/categories/$categoryId/products/$productId.json');
    final productUrl = Uri.parse('$baseUrl/products/$productId.json');

    try {
      final categoryRes =
          await http.put(categoryUrl, body: jsonEncode(productData));
      final productRes =
          await http.put(productUrl, body: jsonEncode(fullProductData));

      if (categoryRes.statusCode == 200 && productRes.statusCode == 200) {
        print('Product added successfully in both places.');
      } else {
        print('Error adding product: ${categoryRes.body} | ${productRes.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<Map<String, dynamic>?> getProduct(String productId) async {
    final url = Uri.parse('$baseUrl/products/$productId.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print('Failed to load product: $e');
    }
    return null;
  }

  Future<void> editProduct({
    required String productId,
    required String categoryId,
    required String name,
    required String image,
    required double price,
    required String color,
    required String gender,
    required int count,
    required double rating,
    required String description,
    required Map<String, dynamic> specifications,
  }) async {
    final productUrl = Uri.parse('$baseUrl/products/$productId.json');
    final categoryUrl =
        Uri.parse('$baseUrl/categories/$categoryId/products/$productId.json');

    final productData = {
      'name': name,
      'image': image,
      'price': price,
      'category': categoryId,
      'description': description,
      'specifications': specifications,
    };

    final categoryProductData = {
      'name': name,
      'image': image,
      'price': price,
      'color': color,
      'gender': gender,
      'count': count,
      'rating': rating,
    };

    try {
      final res1 = await http.put(productUrl, body: jsonEncode(productData));
      final res2 =
          await http.put(categoryUrl, body: jsonEncode(categoryProductData));

      if (res1.statusCode == 200 && res2.statusCode == 200) {
        print('Product edited successfully in both places.');
      } else {
        print(
            'Failed to edit product. productRes: ${res1.body}, categoryRes: ${res2.body}');
      }
    } catch (e) {
      print('Exception while editing product: $e');
    }
  }

  Future<void> deleteProduct({
    required String productId,
    required String categoryId,
  }) async {
    final productUrl = Uri.parse('$baseUrl/products/$productId.json');
    final categoryProductUrl = Uri.parse(
      '$baseUrl/categories/$categoryId/products/$productId.json',
    );

    try {
      final res1 = await http.delete(productUrl);
      final res2 = await http.delete(categoryProductUrl);

      if (res1.statusCode == 200 && res2.statusCode == 200) {
        print('Product deleted successfully from both places.');
      } else {
        print(
            'Failed to delete product. productRes: ${res1.body}, categoryRes: ${res2.body}');
      }
    } catch (e) {
      print('Exception while deleting product: $e');
    }
  }
}
