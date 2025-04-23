import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/cart_v1_screen/widgets/check_out_button.dart';

class ProfileShowmodal extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController adressController;
  const ProfileShowmodal({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.adressController,
  });

  @override
  State<ProfileShowmodal> createState() => _ProfileShowmodalState();
}

class _ProfileShowmodalState extends State<ProfileShowmodal> {
  final viewModel = UserViewmodel();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 700,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 180),
                    child: Container(
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        spacing: 8,
                        children: [
                          Text(
                            "Edit profile",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Please, editing your accaount",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          SizedBox(
                            width: 305,
                            child: Column(
                              spacing: 10,
                              children: [
                                TextField(
                                  controller: widget.nameController,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder()),
                                ),
                                TextField(
                                  controller: widget.emailController,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder()),
                                ),
                                TextField(
                                  controller: widget.phoneController,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.phone),
                                      border: OutlineInputBorder()),
                                ),
                                TextField(
                                  controller: widget.passwordController,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.password),
                                      border: OutlineInputBorder()),
                                ),
                                TextField(
                                  controller: widget.adressController,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.home),
                                      border: OutlineInputBorder()),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 10),
                    child: Column(
                      spacing: 16,
                      children: [
                        CheckOutButton(
                          onTap: () async {
                            await viewModel.update(
                              name: widget.nameController.text,
                              email: widget.emailController.text,
                              phone: widget.phoneController.text,
                              password: widget.passwordController.text,
                              adress: widget.adressController.text,
                            );
                            if (context.mounted) {
                              Navigator.pop(context, true);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
