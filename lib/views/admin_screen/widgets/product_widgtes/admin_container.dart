import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminContainer extends StatelessWidget {
  final String text;
  final Widget to;

  const AdminContainer({super.key, required this.text, required this.to});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => to));
      },
      child: Container(
        height: 100.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
