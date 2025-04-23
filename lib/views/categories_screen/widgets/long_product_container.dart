import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LongProductContainer extends StatelessWidget {
  final String title;
  final String image;
  final String number;
  final double rating;

  const LongProductContainer({
    Key? key,
    required this.title,
    required this.image,
    required this.number,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Container(
        height: 112.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(24.w),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Container(
                width: 88.w,
                height: 88.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // ✅ Text and rating
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        ...List.generate(5, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                            child: Icon(
                              Icons.star,
                              size: 10.w,
                              color:
                                  index < rating.floor()
                                      ? Colors.amber
                                      : index < rating
                                      ? Colors.amber.withOpacity(0.5)
                                      : Colors.grey[300],
                            ),
                          );
                        }),
                      ],
                    ),

                    Text(
                      "$number \$",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
