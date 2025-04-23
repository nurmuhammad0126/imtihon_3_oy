import 'package:flutter/material.dart';

import '../../../repository/user_repository.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../single_products/profile_showModal.dart';
import '../../splash_screen/screen/splash_1_screen.dart';
import '../widgets/profile_cards.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  final userRepo = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        "Lee Waters",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "hello.carrotlabs@gmail.com",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileCards(),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => ProfileShowmodal());
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
