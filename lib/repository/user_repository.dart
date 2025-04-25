import 'package:flutter_3_oy_imtixon/data/local_datasource/admin_local_datasource.dart';
import 'package:flutter_3_oy_imtixon/data/local_datasource/user_local_datasource.dart';
import 'package:flutter_3_oy_imtixon/data/remote_datasource/user_remote_datasource.dart';
import 'package:flutter_3_oy_imtixon/models/admin_model.dart';
import 'package:flutter_3_oy_imtixon/models/user_model.dart';

class UserRepository {
  final userRemoteDatasource = UserRemoteDatasource();
  final userlocalDatasource = UserLocalDatasource();
  final adminLocalDatasource = AdminLocalDatasource();



  //// Admin  =====================================================================================
  //! GET admin
  Future<AdminModel?> getAdmin() async {
    return await adminLocalDatasource.getAdmin();
  }

  //! LOGOUT admin
  Future<void> logoutAdmin() async {
    await adminLocalDatasource.delete();
  }

  //! LOGIN and save admin in local
  Future<void> loginSaveAdmin(AdminModel admin) async {
    await adminLocalDatasource.saveadmin(admin);
  }



  //// User
  //! GET user 
  Future<UserModel?> getUser() async {
    return await userlocalDatasource.getUser();
  }

  //! LOGOUT user 
  Future<void> logOut() async {
    await userlocalDatasource.delete();
  }


  //! LOGIN and save user in local
  Future<void> logInSave(UserModel user) async {
    await userlocalDatasource.saveUser(user);
  }

  //! GET users  
  Future<List<UserModel>?> getUsers() async {
    return await userRemoteDatasource.getUsers();
  }

  //! UPDATE user in REMOTE
  Future<void> updateUserRemote(UserModel user) async {
    await userRemoteDatasource.updateUser(user);
  }

  ///// REGISTER user
  Future<bool> register(UserModel user) async {
    final users = await getUsers();
    if (users != null) {
      for (var i in users) {
        if (i.email == user.email && user.password == i.password) {
          return false;
        }
      }
      await userRemoteDatasource.addUser(user);
      return true;
    }

    await userRemoteDatasource.addUser(user);
    return true;
  }

}
