import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/add_button.dart';
import '../../widgets/color_selector.dart';
import '../../widgets/page_indicator.dart';
import '../../widgets/rating_dots.dart';

class SingleProductV1 extends StatefulWidget {
  const SingleProductV1({super.key});

  @override
  State<SingleProductV1> createState() => _SingleProductV1State();
}

class _SingleProductV1State extends State<SingleProductV1> {
  int _currentPage = 0;
  int _selectedColor = 0;

  final List<Color> _colors = [
    Colors.amber,
    Colors.pink.shade100,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 3,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Image.asset(
                AppImages.kalonka,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),
          Positioned(
            top: 40.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.backicon, height: 24.h, width: 24.w),
                PageIndicator(currentIndex: _currentPage, length: 3),
                Image.asset(AppImages.bag, height: 24.h, width: 24.w),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 404.h,
              width: 375.w,
              padding: EdgeInsets.only(top: 50.h, left: 30.w, right: 30.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Speakers",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Beosound Balance",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RatingDots(),
                  SizedBox(height: 20.h),
                  Text(
                    "\$1,600",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "AVAILABLE COLORS",
                    style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                  ),
                  SizedBox(height: 20.h),
                  ColorSelector(
                    colors: _colors,
                    selectedIndex: _selectedColor,
                    onTap: (index) {
                      setState(() => _selectedColor = index);
                    },
                  ),
                  SizedBox(height: 50.h),
                  AddButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
