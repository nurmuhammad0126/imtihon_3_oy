import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';
import 'package:http/http.dart' as http;

class UserViewmodel {
  UserViewmodel._internal();

  static final UserViewmodel _instance = UserViewmodel._internal();
  factory UserViewmodel() => _instance;

  final repo = UserRepository();
  UserModel? userGlobal;

  //! LOGIN
  Future<bool> login({required String email, required String password}) async {
    final users = await repo.getUsers() as List<UserModel>;
    for (var user in users) {
      if (user.email == email && user.password.toString() == password) {
        await repo.logInSave(user);
        userGlobal = user;
        return true;
      }
    }
    return false;
  }

  //! LOG OUT
  Future<void> logOut() async {
    await repo.logOut();
  }

  //! REGISTER
  Future<void> register(UserModel user) async {
    await repo.logInSave(user);
  }

  //! GET user
  Future<UserModel?> getUser({required String id}) async {
    final users = await repo.getUsers() as List<UserModel>;
    for (var user in users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  // Update password
  Future<void> updatePassword(String email, String newPassword) async {
    final users = await repo.getUsers();

    if (users == null || users.isEmpty) {
      throw Exception("Foydalanuvchilar topilmadi!");
    }

    try {
      final entry = users
          .firstWhere((t) => t.email.trim() == email.trim())
          .copyWith(password: newPassword);

      final patchUrl =
          'https://exam3-85adf-default-rtdb.firebaseio.com/exam3/users/${entry.id}.json';

      final resp = await http.patch(
        Uri.parse(patchUrl),
        body: jsonEncode(entry.toJson()),
      );

      print("UPDATE RESPONSE: ${jsonDecode(resp.body)}");
    } catch (e) {
      print("FOYDALANUVCHI TOPILMADI yoki xatolik: $e");
      throw Exception("Foydalanuvchi topilmadi yoki xatolik yuz berdi.");
    }
  }
}
