import 'package:flutter/material.dart';

import '../../order_review/screen/order_review_screen.dart';
import '../../payment_cart/screen/payment_screen.dart';
import '../../widgets/credit_cart.dart';
import '../../widgets/field_button.dart';
import '../../widgets/list_tile.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({super.key});

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Payment Method"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.credit_card),
                onPressed: () {},
              ),
              Text("Credit Card"),
              IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () {},
              )
            ],
          ),
          Row(
            children: [
              FilledButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentCard()));
                },
              ),
              TravelCard(),
            ],
          ),
          Container(
            height: 2,
            width: width * 0.8,
            decoration: BoxDecoration(color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          LISTTILE(
            logo: Icons.payment,
            title: "PayPal",
            subtitle: "Hello.carrotlabs@gmail.com",
          ),
          Container(
            height: 2,
            width: width * 0.8,
            decoration: BoxDecoration(color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          LISTTILE(
            logo: Icons.apple,
            title: "Apple Pay",
            subtitle: "**** 9000",
          ),
          SizedBox(
            height: 80,
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
      ),
    );
  }
}
