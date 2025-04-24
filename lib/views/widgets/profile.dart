import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUser extends StatelessWidget {
  final String image;
  final String title;
  final String trailing;

  const ProfileUser({
    super.key,
    required this.image,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  i == 4
                      ? Icon(
                          Icons.rectangle,
                          size: 14.sp,
                          color: Colors.blueGrey.withOpacity(0.3),
                        )
                      : Icon(Icons.rectangle, color: Colors.amber, size: 14.sp),
              ],
            ),
          ],
        ),
        trailing: Text(
          trailing,
          style: TextStyle(
            color: Colors.black.withOpacity(0.3),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
