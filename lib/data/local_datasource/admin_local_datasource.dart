// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/admin_model.dart';

class AdminLocalDatasource {
  final String _adminKey = 'admin';

  Future<AdminModel?> getAdmin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final adminData = prefs.getString(_adminKey);

      if (adminData != null) {
        final decodedData = jsonDecode(adminData);
        final admin = AdminModel.fromJson(json: decodedData);
        return admin;
      }
    } catch (e) {
      print("Error in getting admin: $e");
    }
    return null;
  }

  Future<void> saveadmin(AdminModel admin) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final Map mapData = admin.toJson();

      await prefs.setString(_adminKey, jsonEncode(mapData));
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_adminKey);
    } catch (e) {
      print(e);
    }
  }
}
