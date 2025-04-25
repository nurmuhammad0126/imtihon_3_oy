import 'dart:convert';

import 'package:flutter_3_oy_imtixon/models/admin_model.dart';
import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';
import 'package:http/http.dart' as http;

class UserViewmodel {
  UserViewmodel._internal();

  static final UserViewmodel _instance = UserViewmodel._internal();
  factory UserViewmodel() => _instance;

  final repo = UserRepository();
  UserModel? userGlobal;
  AdminModel? adminGlobal;


  ///// Admin========================================================================================================
  // LOGIN
  Future<bool> loginAdmin({
    required String login,
    required String password,
  }) async {
    final url = Uri.parse(
        "https://exam3-85adf-default-rtdb.firebaseio.com/exam3/admins.json");
    final response = await http.get(url);

    final res = jsonDecode(response.body);

    if (res != null) {
      if (res["email"].toString() == login.toString() &&
          res["password"].toString() == password.toString()) {
          res["id"] = "admins";
        adminGlobal = AdminModel.fromJson(json: res);
        repo.loginSaveAdmin(adminGlobal!);
        return true;
      }
    }

    return false;
  }

  // LOGOUT
  Future<void> logOutAdmin()async{
    await repo.logoutAdmin();
  }

  // GET admin
  Future<void> getAdmin()async{
    adminGlobal =  await repo.getAdmin();
  }



  ///// User============================================================================================================
  //! LOGIN
  Future<bool> login({required String login, required String password}) async {
    final users = await repo.getUsers() as List<UserModel>;
    for (var user in users) {
      if ((user.email == login || user.phone == login) &&
          user.password.toString() == password) {
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
  Future<bool> register(UserModel user) async {
    return await repo.register(user);
  }

  //! GET user
  Future<void> getUser() async {
    final user = await repo.getUser();
    userGlobal = user;
  }

  Future<bool> getUserFromId({required String id}) async {
    final users = await repo.getUsers() as List<UserModel>;
    for (var user in users) {
      if (user.id == id) {
        userGlobal = user;
        return true;
      }
    }
    return false;
  }

  // Update password from email
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

  // Update password from PhoneNumber
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
