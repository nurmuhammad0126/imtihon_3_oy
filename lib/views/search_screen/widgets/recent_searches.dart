import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSearches extends StatelessWidget {
  final String h1text;
  const RecentSearches({super.key, required this.h1text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        // height: 45.h,
        width: 305.w,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3.w, color: Colors.black)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.watch_later_outlined),
                SizedBox(width: 18.w),
                Text(
                  h1text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
