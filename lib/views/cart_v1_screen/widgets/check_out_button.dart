import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';

class CheckOutButton extends StatelessWidget {
  final Function onTap;
  const CheckOutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await onTap();
      },
      child: Container(
        width: 305,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 117, right: 10),
          child: Row(
            children: [
              Text(
                "Checkout",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Icon(Icons.navigate_next),
            ],
          ),
        ),
      ),
    );
  }
}
