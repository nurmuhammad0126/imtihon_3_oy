import 'package:flutter/material.dart';

class ProductDetails2 extends StatelessWidget {
  const ProductDetails2({super.key});

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
              child: Icon(Icons.percent),
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
                    "Promo Code",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "- \$100.00",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 56,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "CA#132",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
