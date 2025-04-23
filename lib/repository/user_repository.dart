import 'package:flutter_3_oy_imtixon/data/local_datasource/user_local_datasource.dart';
import 'package:flutter_3_oy_imtixon/data/remote_datasource/user_remote_datasource.dart';
import 'package:flutter_3_oy_imtixon/models/user_model.dart';

class UserRepository {
  final userRemoteDatasource = UserRemoteDatasource();
  final userlocalDatasource = UserLocalDatasource();

  Future<UserModel?> getUser() async {
    return await userlocalDatasource.getUser();
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
      userRemoteDatasource.addUser(user);
      return true;
    }

    userRemoteDatasource.addUser(user);
    return true;
  }

  Future<void> updateUserRemote(UserModel user)async{
    await userRemoteDatasource.updateUser(user);
  }
}
