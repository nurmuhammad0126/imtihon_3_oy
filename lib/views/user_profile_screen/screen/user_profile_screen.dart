import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/splash_screen/screen/splash_1_screen.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../single_products/profile_showModal.dart';
import '../widgets/profile_cards.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final userRepo = UserRepository();
  UserModel? userModel2;
  final userViewModel = UserViewmodel();
  bool isDownload = false;

  @override
  void initState() {
    super.initState();
    isDownload = true;

    userModel2 = userViewModel.userGlobal;

    setState(() {
      isDownload = false;
    });
    // start();
  }

  void start() async {
    isDownload = true;

    userModel2 = userViewModel.userGlobal;

    setState(() {
      isDownload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isDownload
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.yellow,
              actions: [
                Text("Log Out"),
                IconButton(
                    onPressed: () async {
                      await userRepo.logOut();
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Splash1Screen(),
                            ),
                            (newRoute) => true);
                      }
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 553,
                  color: AppColors.yellow,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: NetworkImage(AppImages.profilePerson),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              userModel2!.profile.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userModel2!.email,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      userModel2!.orders != null &&
                              userModel2!.orders!.isNotEmpty
                          ? ProfileCards(
                              idOrder: userModel2!.orders!.first.id,
                              status: userModel2!.orders!.first.status,
                              products: userModel2!.orders!.first.products,
                            )
                          : Text(
                              "Sizda hali hech qanday buyurtma mavjud emas",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => ProfileShowmodal());
                  },
                  child: SizedBox(
                    width: 305,
                    height: 65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "My accaunt",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Edit your informations",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.navigate_next,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          );
  }
}
