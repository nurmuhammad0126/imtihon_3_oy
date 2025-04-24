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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final adressController = TextEditingController();

  final userRepo = UserRepository();
  UserModel? userModel;
  final userViewModel = UserViewmodel();
  bool isDownload = false;

  @override
  void initState() {
    super.initState();
    isDownload = true;

    userModel = userViewModel.userGlobal;

    setState(() {
      isDownload = false;
    });
    start();
  }

  void start() async {
    isDownload = true;

    userModel = userViewModel.userGlobal;

    setState(() {
      isDownload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isDownload
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.yellow,
              actions: [
                const Text("Log Out"),
                IconButton(
                    onPressed: () async {
                      await userRepo.logOut();
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Splash1Screen(),
                            ),
                            (newRoute) => true);
                      }
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            body: userModel == null
                ? Center(child: Text("No user data available"))
                : Column(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            AppImages.profilePerson),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  if (userModel?.profile != null)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userModel!.profile.name ?? "No name",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          userModel!.email ?? "No email",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    )
                                  else
                                    Text("Profile information not available"),
                                ],
                              ),
                            ),
                            if (userModel?.orders != null &&
                                userModel!.orders!.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 313,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: userModel!.orders!.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 15,
                                    ),
                                    itemBuilder: (context, index) =>
                                        ProfileCards(
                                      idOrder:
                                          userModel!.orders![index].id ?? "",
                                      status:
                                          userModel!.orders![index].status ??
                                              "processing",
                                      products:
                                          userModel!.orders![index].products ??
                                              [],
                                    ),
                                  ),
                                ),
                              )
                            else
                              Text("Sizda hozircha buyurtmalar yo'q 😊")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      GestureDetector(
                        
                        onTap: () async {
                          final res = await showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                emailController.text = userModel!.email;
                                nameController.text = userModel!.profile.name;
                                phoneController.text = userModel!.phone;
                                passwordController.text = userModel!.password;
                                adressController.text =
                                    userModel!.profile.address;
                                return ProfileShowmodal(
                                  adressController: adressController,
                                  phoneController: phoneController,
                                  nameController: nameController,
                                  passwordController: passwordController,
                                  emailController: emailController,
                                );
                              });

                          if (res == true) {
                            userModel = userViewModel.userGlobal;
                            setState(() {});
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(),
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
