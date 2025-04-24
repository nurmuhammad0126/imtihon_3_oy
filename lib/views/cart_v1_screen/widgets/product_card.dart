import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/cart_item_model.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_cart_viewmodel.dart';

class ProductCard extends StatefulWidget {
  final CartItemModel cartItem;
  const ProductCard({super.key, required this.cartItem});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  CartItemModel? cart;
  final userCartViewmodel = UserCartViewmodel();
  @override
  void initState() {
    super.initState();
    cart = widget.cartItem;
  }

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
              child: Image.network(cart?.image ?? ""),
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
                          cart?.productName ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(

                        //   style: TextStyle(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.bold,
                        //       color: AppColors.textColor.withAlpha(125)),
                        // ),
                        Text(
                          cart?.productPrice.toString() ?? "",
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
                              onTap: () async {
                                if (cart != null) {
                                  int count = cart!.quantity!;

                                  if (cart!.quantity! > 0) {
                                    count = cart!.quantity! - 1;
                                  }

                                  await userCartViewmodel.updateCartQuantity(
                                      cart!, count);
                                  cart = cart!.copyWith(quantity: count);
                                  setState(() {});
                                }
                              },
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
                                "${cart?.quantity ?? 1}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () async {
                                if (cart != null) {
                                  final count = cart!.quantity! + 1;

                                  await userCartViewmodel.updateCartQuantity(
                                      cart!, count);
                                  cart = cart!.copyWith(quantity: count);
                                  setState(() {});
                                }
                              },
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
