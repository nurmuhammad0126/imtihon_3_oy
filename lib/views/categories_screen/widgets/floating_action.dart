import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/views/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ));
      },
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Center(child: Icon(Icons.home)),
      ),
    );
  }
}
