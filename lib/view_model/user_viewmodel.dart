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
  Future<bool> login({required String login, required String password}) async {
    final users = await repo.getUsers() as List<UserModel>;
    for (var user in users) {
      if ((user.email == login || user.phone == login) && user.password.toString() == password) {
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
  Future<void> updateEmailPassword(String email, String newPassword) async {
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



  Future<void> updatePhonePassword(String phone, String newPassword) async {
    final users = await repo.getUsers();

    if (users == null || users.isEmpty) {
      throw Exception("Foydalanuvchilar topilmadi!");
    }

    try {
      final entry = users
          .firstWhere((t) => t.phone.trim() == phone.trim())
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


  Future<void> update({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String adress,
  }) async {
    if (userGlobal != null) {
      userGlobal = userGlobal!.copyWith(
          profile: userGlobal!.profile.copyWith(name: name, address: adress),
          email: email,
          phone: phone,
          password: password);

      await repo.updateUserRemote(userGlobal!);
      await repo.logOut();
      await repo.logInSave(userGlobal!);
    }
  }

}
