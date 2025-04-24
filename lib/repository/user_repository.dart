import 'package:flutter_3_oy_imtixon/data/local_datasource/admin_local_datasource.dart';
import 'package:flutter_3_oy_imtixon/data/local_datasource/user_local_datasource.dart';
import 'package:flutter_3_oy_imtixon/data/remote_datasource/user_remote_datasource.dart';
import 'package:flutter_3_oy_imtixon/models/admin_model.dart';
import 'package:flutter_3_oy_imtixon/models/user_model.dart';

class UserRepository {
  final userRemoteDatasource = UserRemoteDatasource();
  final userlocalDatasource = UserLocalDatasource();
  final adminLocalDatasource = AdminLocalDatasource();

  Future<UserModel?> getUser() async {
    return await userlocalDatasource.getUser();
  }

  Future<AdminModel?> getAdmin() async {
    return await adminLocalDatasource.getAdmin();
  }

  Future<void> logoutAdmin() async {
    await adminLocalDatasource.delete();
  }

  Future<void> loginSaveAdmin(AdminModel admin) async {
    await adminLocalDatasource.saveadmin(admin);
  }

  Future<void> logOut() async {
    await userlocalDatasource.delete();
  }

  Future<void> logInSave(UserModel user) async {
    await userlocalDatasource.saveUser(user);
  }

  Future<List<UserModel>?> getUsers() async {
    return await userRemoteDatasource.getUsers();
  }

  Future<bool> register(UserModel user) async {
    final users = await userRemoteDatasource.getUsers();
    if (users != null) {
      for (var i in users) {
        if (i.email == user.email) {
          return false;
        }
      }
      await userRemoteDatasource.addUser(user);
      return true;
    }

    await userRemoteDatasource.addUser(user);
    return true;
  }

  Future<void> updateUserRemote(UserModel user) async {
    await userRemoteDatasource.updateUser(user);
  }
}
