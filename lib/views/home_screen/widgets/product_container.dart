import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatelessWidget {
  final String title;
  final String image;
  final String number;
  const ProductContainer({
    super.key,
    required this.title,
    required this.image,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        height: 248.h,
        width: 205.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.w),
          color: Color.fromARGB(255, 160, 161, 162),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 1100.w,
              height: 113.h,
              child: Image.network(image, height: 120.h, width: 190.w),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(number, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
