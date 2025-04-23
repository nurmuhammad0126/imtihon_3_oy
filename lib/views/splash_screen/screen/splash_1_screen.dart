import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/main_screen.dart';
import 'package:flutter_3_oy_imtixon/views/splash_screen/screen/splash_screen.dart';

class Splash1Screen extends StatefulWidget {
  const Splash1Screen({super.key});

  @override
  State<Splash1Screen> createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen> {
  final userRepo = UserRepository();
  final userViewmodel = UserViewmodel();
  @override
  void initState() {
    super.initState();
    isUser();
  }

  void isUser() async {
    final user = await userRepo.getUser();

    if (user != null) {
      await Future.delayed(Duration(seconds: 2));
      userViewmodel.userGlobal = user;

      print(
          "##########################################################################################");
      print(userViewmodel.userGlobal?.toJson());

      print(
          "##########################################################################################");
      print(user.toJson());
      print(
          "##########################################################################################");

      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => MainScreen()));
      }
    } else {
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => SplashScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "ONLINE MARKET",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
