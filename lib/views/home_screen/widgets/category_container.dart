import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;
  const CategoryContainer({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: GestureDetector(
        onTap: onTap,
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
              Image.network(category.image, height: 120.h, width: 190.w),
              Text(
                category.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(category.products.length.toString(),
                  style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
