import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';

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
}
