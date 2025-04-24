// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../view_model/user_viewmodel.dart';
import '../../payment_sucseful_screen/screen/payment_sucseful_screen.dart';
import '../../widgets/field_button.dart';
import '../../widgets/order.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({super.key});

  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  final viewModel = UserViewmodel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(viewModel.userGlobal!.cart!.first.image);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Order Review"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 128,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Order(
                          imageUrl:
                              "${viewModel.userGlobal?.cart?[index].image}"),
                      Text(
                          "${viewModel.userGlobal?.cart?[index].productName}")
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
                  itemCount: viewModel.userGlobal!.cart!.length,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 2,
            width: width * 0.9,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Text("Shipping"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.local_activity),
              Text("178 Broadway, Brooklyn,…"),
              FilledButton(
                child: Text("Change"),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(Icons.cabin),
                Column(
                  children: [Text("Standard"), Text("2-3 days")],
                ),
                Icon(Icons.arrow_downward),
              ],
            ),
          ),
          Text("Payment"),
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "* * * *    9000",
                    style: TextStyle(color: Colors.white),
                  ),
                  FilledButton(
                    child: Text("Change"),
                    onPressed: () {},
                  )
                ]),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 2,
            width: width * 0.9,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping :"),
                Text("Free :"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: :"),
                Text("\$ 9,800"),
              ],
            ),
          ),
          FILEDButton(
            buttonColor: Colors.yellow,
            name: "Continue to Payment",
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentSucseful()),
                //! Payment succses
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
