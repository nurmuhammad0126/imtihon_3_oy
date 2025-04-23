import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';

class UserViewmodel {
  final repo = UserRepository();

  //! LOGIN
  Future<bool> login({required String email, required String password}) async {
    final users = await repo.getUsers() as List<UserModel>;
    for (var user in users) {
      if (user.email == email && user.password.toString() == password) {
        await repo.logInSave(user);
        return true;
      }
    }
    return false;
  }

  //! LOG OUT

  //! REGISTER
  Future<void> register(UserModel user) async {
    await repo.logInSave(user);
  }
}
