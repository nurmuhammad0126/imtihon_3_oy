import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users";

  Future<List<UserModel>?> getUsers() async {
    final url = Uri.parse("$_baseUrl.json");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data.entries
          .map(
            (e) => UserModel.fromJson(e.key, e.value),
          )
          .toList();
    } else {
      return null;
    }
  }

  Future<bool> addUser(UserModel user) async {
    final url = Uri.parse("$_baseUrl.json");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> updateUser(UserModel user) async {
    final url = Uri.parse("$_baseUrl/${user.id}.json");
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteUser(String userId) async {
    if (userId.isEmpty) {
      return false;
    }
    final url = Uri.parse('$_baseUrl/$userId.json');
    final response = await http.delete(
      url,
    );
    return response.statusCode == 200;
  }
}
