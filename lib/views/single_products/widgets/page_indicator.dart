import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration:  Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: isActive ? 20.w : 10.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10.r),
          ),
        );
      }),
    );
  }
}
