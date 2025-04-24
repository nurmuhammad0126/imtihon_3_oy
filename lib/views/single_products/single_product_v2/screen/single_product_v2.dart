import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/add_button.dart';
import '../../widgets/color_selector.dart';

class SingleProductV2 extends StatefulWidget {
  const SingleProductV2({super.key});

  @override
  State<SingleProductV2> createState() => _SingleProductV2State();
}

class _SingleProductV2State extends State<SingleProductV2> {
  int _selectedColor = 0;

  final List<Color> _colors = [
    Colors.amber,
    Colors.pink.shade100,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 30.w, right: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AppImages.backicon,
                            height: 24.h,
                            width: 24.w,
                          ),
                          Image.asset(
                            AppImages.bag,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Text(
                        "Speakers",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Beosound\nBalance",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "From",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "\$1,600",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "Available Colors",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 12.h),
                      ColorSelector(
                        colors: _colors,
                        selectedIndex: _selectedColor,
                        onTap: (index) {
                          setState(() => _selectedColor = index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 100.h,
                    bottom: 30.h,
                    right: 30.w,
                    left: 30.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wireless, smart home speaker",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "A wireless speaker with a dynamic acoustic performance designed to be positioned up against the wall on a shelf or side table in your home. Impressive sound compared to its size.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Spacer(),
                      AddButton(onTap: (){},),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 300.h,
            left: 220.w,
            child: Image.asset(AppImages.blackkalonka, height: 220.h),
          ),
        ],
      ),
    );
  }
}
