import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final String image;
  final String number;
  const CategoryContainer({
    Key? key,
    required this.title,
    required this.image,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: GestureDetector(
        onTap: (){},
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
              Image.network(image, height: 120.h, width: 190.w),
        
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(number, style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
