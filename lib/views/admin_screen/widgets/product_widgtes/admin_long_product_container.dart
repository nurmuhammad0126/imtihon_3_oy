import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/product_view_model/admin_product_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/screen/product_screen/edit_product_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminLongProductContainer extends StatelessWidget {
  final String title;
  final String image;
  final String number;
  final String productId;
  final String category;
  final onDeleted;

  const AdminLongProductContainer({
    super.key,
    required this.title,
    required this.image,
    required this.number,
    required this.productId,
    required this.category,
    required this.onDeleted,
  });

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
                      children: [],
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
            Spacer(),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProductScreen(
                                  productId: productId, categoryId: category)));
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () async {
                      await AdminProductViewmodel().deleteProduct(
                          productId: productId, categoryId: category);
                      onDeleted();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
