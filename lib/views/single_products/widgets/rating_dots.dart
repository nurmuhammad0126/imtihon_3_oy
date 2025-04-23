import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingDots extends StatelessWidget {
  const RatingDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "4.5",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        ),
        Text(
          " (1k Reviews)",
          style: TextStyle(color: Colors.black, fontSize: 12.sp),
        ),
        SizedBox(width: 8.w),
        ...List.generate(5, (index) {
          return Container(
            margin: EdgeInsets.only(right: 5.w),
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: index == 4 ? Colors.grey : Colors.amber,
              borderRadius: BorderRadius.circular(3.r),
            ),
          );
        }),
      ],
    );
  }
}
