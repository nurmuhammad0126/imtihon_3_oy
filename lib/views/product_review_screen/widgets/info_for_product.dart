import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoForProduct extends StatelessWidget {
  final String leading;
  final double lineValue;
  final String trailing;

  const InfoForProduct({
    super.key,
    required this.leading,
    required this.lineValue,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 8.h),
      child: Row(
        spacing: 5.w,
        children: [
          Text(
            leading,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.rectangle, color: Colors.amber, size: 22.sp),
          Expanded(
            child: LinearProgressIndicator(
              value: lineValue,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Colors.grey[300],
              minHeight: 5,
            ),
          ),
          Text(
            trailing,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
