import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(colors.length, (index) {
        final isSelected = index == selectedIndex;
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            margin: EdgeInsets.only(right: 8.w),
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    size: 18.sp,
                    color: index == 2 ? Colors.white : Colors.black,
                  )
                : null,
          ),
        );
      }),
    );
  }
}
