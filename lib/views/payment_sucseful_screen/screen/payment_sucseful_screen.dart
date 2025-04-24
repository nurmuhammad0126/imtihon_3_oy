import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_order_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/main_screen.dart';

import '../../../view_model/user_cart_viewmodel.dart';
import '../../../view_model/user_viewmodel.dart';
import '../../widgets/field_button.dart';
import '../../widgets/order.dart';

class PaymentSucseful extends StatefulWidget {
  const PaymentSucseful({super.key});

  @override
  State<PaymentSucseful> createState() => _PaymentSucsefulState();
}

class _PaymentSucsefulState extends State<PaymentSucseful> {
  final cartOrder = UserOrderViewmodel();
  final viewModel2 = UserCartViewmodel();
  final viewModel = UserViewmodel();

  @override
  Widget build(BuildContext context) {
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FilledButton(
          onPressed: () {},
          child: Icon(Icons.credit_card),
        ),
        Text("Payment Successful!"),
        Text("Orders will arrive in 3 days!"),
        SizedBox(
          height: 40,
        ),
        Container(
          color: Colors.black,
        ),
        SizedBox(
          height: 40,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Order(
                    imageUrl: "${viewModel.userGlobal!.cart![index].image}"),
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
                itemCount: viewModel.userGlobal!.cart!.length,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        FILEDButton(
          buttonColor: Colors.yellow,
          name: "Continue to Payment",
          icon: Icon(Icons.arrow_left),
          onPressed: () async {
            await cartOrder.addUserOrder();
            if (context.mounted) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => MainScreen()));
            }
          },
          heightFactor: 0.2,
          widthFactor: 0.8,
        ),
      ]),
    );
  }
}
