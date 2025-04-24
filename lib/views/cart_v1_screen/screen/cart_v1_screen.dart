import 'package:flutter/material.dart';

import '../../../view_model/user_viewmodel.dart';
import '../../peyment_method/screen/payment_method_screen.dart';
import '../widgets/check_out_button.dart';
import '../widgets/product_card.dart';
import '../widgets/showModal.dart';

class CartV1Screen extends StatefulWidget {
  const CartV1Screen({super.key});

  @override
  State<CartV1Screen> createState() => _CartV1ScreenState();
}

class _CartV1ScreenState extends State<CartV1Screen> {
  double totalPrice = 0;
  final viewModel = UserViewmodel();

  @override
  void initState() {
    super.initState();
    totalPriceFunc();
  }

  void totalPriceFunc() async {
    totalPrice = 0;
    await viewModel.getUserFromId(id: viewModel.userGlobal!.id);
    if (viewModel.userGlobal != null && viewModel.userGlobal?.cart != null) {
      for (var item in viewModel.userGlobal!.cart!) {
        totalPrice = totalPrice + (item.quantity! * item.productPrice!);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "MY CART",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 35,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 550,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 360,
                    width: double.infinity,
                    child: ListView.separated(
                        separatorBuilder: (ctx, index) => SizedBox(height: 20),
                        itemCount: viewModel.userGlobal!.cart!.length,
                        itemBuilder: (ctx, index) {
                          final cartItem = viewModel.userGlobal!.cart![index];
                          return ProductCard(
                            cartItem: cartItem,
                            totalPrice: totalPriceFunc,
                          );
                        }),
                  ),
                ),
                Spacer(),
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$ $totalPrice",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => Showmodal(),
                    );
                  },
                  child: CheckOutButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => PaymentMethodView()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
