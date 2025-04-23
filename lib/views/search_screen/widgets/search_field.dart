import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 44.h,
        width: 305.w,
        decoration: BoxDecoration(
          color: const Color.fromARGB(
            255,
            214,
            210,
            210,
          ), //!color color color color  color
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                "Search on caStore",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.h),
              ),
              Spacer(),
              Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}
