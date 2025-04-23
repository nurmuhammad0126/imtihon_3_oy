import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/info_for_product.dart';
import '../widgets/profile_user.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 360.h,
              decoration: BoxDecoration(color: Color(0xFF8F92A1)),
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/f268/01ae/979bea2b7f9f71d4ff7d6b6af6276289?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=FnKuWQVJYJs0l-qt-45cqwLzNL-oHW4o9MOlxdzvL-2SsXlPQuaxgMLXy-Ct1sqkeUtiHSH42yTrC58wys~1WpnN6DVJMy5PZCcg114OAUwE0TOH-wnAzD5cx4Tf4pbV3WL8Rlx83ID0JPL8dJL-9r1VSrPkNQ9aIbW68jzhLPk7b5ieGRbaiZtP5J5OSZ~pqbSxLbYlZOyxyQ45rLx5WVyGI1p0grKsQS6UcIx0vD~vOwT5Lmy86EP0kZQZ9Q2V0Za9x9LWfn9KSUO4s6Lt9D0fy68HaG5ZI48Chdr6-WH7sKu706wqP4dEYY15jXv0fOPpcwcf8QltGktTHLqwfw__",
              ),
            ),
            Ink(
              padding: EdgeInsets.all(35.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer review",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "4,0",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        i == 4
                            ? Icon(
                                Icons.rectangle,
                                color: Colors.blueGrey.withOpacity(0.3),
                              )
                            : Icon(Icons.rectangle, color: Colors.amber),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            InfoForProduct(leading: "5", lineValue: 0.55, trailing: "55%"),
            InfoForProduct(leading: "4", lineValue: 0.16, trailing: "16%"),
            InfoForProduct(leading: "3", lineValue: 0.14, trailing: "14%"),
            InfoForProduct(leading: "2", lineValue: 0.1, trailing: "1%"),
            InfoForProduct(leading: "1", lineValue: 0.14, trailing: "14%"),
            Ink(
              padding: EdgeInsets.all(35.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1k Reviews",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Ink(
                    width: 98.w,
                    height: 32.h,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New in",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ProfileUser(
              image:
                  "https://s3-alpha-sig.figma.com/img/6aea/14fb/5644e3ad6fed7edb94b5ab9a4abeee52?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=DWPmmFkGkbPaGACFgxQJuOf4UPgOfF4ceX8FQwk4M~ILH3ZkT3C-9uGp4gaWEg8~fFIDEo58IGhZLhRACSU9Ul59TfpWJs8xaG-TFPfMH0GpldPaxJIUYqrCTGgQTAImcC-AbsWbk6gZf227x6OVhSPGXpb60UW5Kc6DE0GpD6dXbkjUR0aPx4r1KacDxOYLe0YnLf0j9ca4aNDMZKudF5LGgwOIMPOIb8KNC34a5F~dLc7jeOg47x36t1k87DkovEWFQdGGyUt1klJEtZY8IRReA1WztVJy1vdR-IrllwtLUTXEQmN02JyVIAhULQHxV5PHZDNd0yLVxAcLWW5CtQ__",
              title: "Eleanor Summers",
              trailing: "Today, 16:40",
            ),
            ProfileUser(
              image:
                  "https://s3-alpha-sig.figma.com/img/6aea/14fb/5644e3ad6fed7edb94b5ab9a4abeee52?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=DWPmmFkGkbPaGACFgxQJuOf4UPgOfF4ceX8FQwk4M~ILH3ZkT3C-9uGp4gaWEg8~fFIDEo58IGhZLhRACSU9Ul59TfpWJs8xaG-TFPfMH0GpldPaxJIUYqrCTGgQTAImcC-AbsWbk6gZf227x6OVhSPGXpb60UW5Kc6DE0GpD6dXbkjUR0aPx4r1KacDxOYLe0YnLf0j9ca4aNDMZKudF5LGgwOIMPOIb8KNC34a5F~dLc7jeOg47x36t1k87DkovEWFQdGGyUt1klJEtZY8IRReA1WztVJy1vdR-IrllwtLUTXEQmN02JyVIAhULQHxV5PHZDNd0yLVxAcLWW5CtQ__",
              title: "Eleanor Summers",
              trailing: "Today, 16:40",
            ),
          ],
        ),
      ),
    );
  }
}
