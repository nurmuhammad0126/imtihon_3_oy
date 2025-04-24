import 'package:flutter/material.dart';

import '../../order_review/screen/order_review_screen.dart';
import '../../widgets/credit_cart.dart';
import '../../widgets/field_button.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
              Text("Add New Card"),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.photo),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            TravelCard(),
            SizedBox(
              height: 20,
            ),
            Text("Card Holder"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nguyen Van Linh',
                prefixIcon: Icon(Icons.man),
              ),
            ),
            Text("Card Number"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '5988 9942 6686 9000',
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // Expiry Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Expiry Date",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "01/2022",
                            prefixIcon: Icon(Icons.credit_card),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // CVV
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CVV",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "000",
                            prefixIcon: Icon(Icons.lock),
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Save to My Cards',
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            FILEDButton(
              buttonColor: Colors.yellow,
              name: "Continue to Payment",
              icon: Icon(Icons.arrow_left),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderReview()),
                );
              },
              heightFactor: 0.2,
              widthFactor: 0.8,
            ),
          ],
        ));
  }
}
