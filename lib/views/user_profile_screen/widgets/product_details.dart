import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(width: 2, color: Colors.grey),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Icon(Icons.badge),
            ),
            SizedBox(
              width: 24,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "2-3 days",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_downward),
          ],
        ),
      ),
    );
  }
}
