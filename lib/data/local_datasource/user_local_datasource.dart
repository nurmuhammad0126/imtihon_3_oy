import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDatasource {
  final String _userKey = 'user';

  Future<UserModel?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);
      if (userData != null) {
        final decodedData = jsonDecode(userData);
        final user = UserModel.fromJson(decodedData["id"], decodedData["data"]);
        return user;
      }
    } catch (e) {
      print("Error in getting user: $e");
    }
    return null;
  }

  Future<void> saveUser(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map mapData = {"id": user.id, "data": user.toJson()};
      await prefs.setString(_userKey, jsonEncode(mapData));
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
    } catch (e) {
      print(e);
    }
  }
}
