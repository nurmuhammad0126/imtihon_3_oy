import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String color;
  final String price;
  final int count;
  const ProductCard({
    super.key,
    required this.color,
    required this.count,
    required this.image,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 142,
      decoration: BoxDecoration(
        color: AppColors.productCardBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
        ),
        child: Row(
          spacing: 16,
          children: [
            SizedBox(
              height: 114,
              width: 88,
              child: Image.network(
                image,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 72,
                    width: 173,
                    child: Column(
                      spacing: 7,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          color,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor.withAlpha(125)),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: SizedBox(
                      height: 24,
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              child: Icon(
                            Icons.remove,
                            size: 16,
                          )),
                          Container(
                            width: 32,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "$count",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                              child: Icon(
                            Icons.add,
                            size: 16,
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
