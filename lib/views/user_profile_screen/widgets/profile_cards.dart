import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';
import 'package:flutter_3_oy_imtixon/utils/app_images.dart';
import 'package:flutter_3_oy_imtixon/views/user_profile_screen/widgets/profile_order.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 313,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "Order #CS1020",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "•  In Progress",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.black.withAlpha(70),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 109,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileOrder(image: AppImages.image1, title: "Beosound 1"),
                    ProfileOrder(image: AppImages.image2, title: "Beosound…"),
                    ProfileOrder(image: AppImages.image3, title: "Beoplay H…"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(),
            SizedBox(
              height: 91,
              width: 257,
              child: Column(
                children: [
                  Text(
                    "Your order is on its way!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Orders will arrive in 3 days!",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 145,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.yellow,
                    ),
                    child: Center(
                      child: Text(
                        "Track",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
