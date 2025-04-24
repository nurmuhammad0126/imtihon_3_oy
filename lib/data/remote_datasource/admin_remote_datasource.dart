import 'dart:convert';
import 'package:flutter_3_oy_imtixon/models/admin_model.dart';
import 'package:http/http.dart' as http;

class AdminRemoteDatasource {
  final String _baseUrl =
      "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/admins";

  Future<List<AdminModel>?> getAdmins() async {
    final url = Uri.parse("$_baseUrl.json");

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != "null") {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return data.entries
          .map(
            (e) {
              final json = e.value;
              json["id"] = e.key;
              return AdminModel.fromJson(json: json);
            },
          )
          .toList();
    }

    return null;
  }

  Future<bool> addAdmin(AdminModel admin) async {
    final url = Uri.parse("$_baseUrl.json");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(admin.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteAdmin(String adminId) async {
    final url = Uri.parse("$_baseUrl/$adminId.json");

    final response = await http.delete(url);

    return response.statusCode == 200;
  }

  Future<bool> updateAdmin(String adminId, AdminModel admin) async {
    final url = Uri.parse("$_baseUrl/$adminId.json");

    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(admin.toJson()),
    );

    return response.statusCode == 200;
  }
}
