import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/screen/admin_user_screen/admin_user_screen.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/screen/product_screen/admin_products_screen.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/widgets/product_widgtes/admin_container.dart';
import 'package:flutter_3_oy_imtixon/views/sign_in_screen/screen/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  UserViewmodel userViewmodel = UserViewmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 148, 194, 231),
        centerTitle: true,
        title: Text(
          "Admin Panel",
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
                const Text("Log Out"),
                IconButton(
                    onPressed: () async {
                      await userViewmodel.logOut();
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SignInScreen(),
                            ),
                            (newRoute) => false);
                      }
                    },
                    icon: const Icon(Icons.logout))
              ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  AdminContainer(
                    text: "Products",
                    to: AdminProductsScreen(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AdminContainer(
                    text: "Users",
                    to: AdminUserScreen(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
