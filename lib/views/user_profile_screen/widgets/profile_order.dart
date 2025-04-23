import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';

class ProfileOrder extends StatelessWidget {
  final String image;
  final String title;
  const ProfileOrder({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      width: 79,
      child: Column(
        spacing: 8,
        children: [
          Container(
            width: 79,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.productCardBackground,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(image),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
