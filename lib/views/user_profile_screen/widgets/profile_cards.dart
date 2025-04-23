import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/cart_item_model.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';
import 'package:flutter_3_oy_imtixon/views/user_profile_screen/widgets/profile_order.dart';

class ProfileCards extends StatefulWidget {
  final List<CartItemModel>? products;
  final String idOrder;
  final String status;
  const ProfileCards({
    super.key,
    required this.idOrder,
    required this.status,
    required this.products,
  });

  @override
  State<ProfileCards> createState() => _ProfileCardsState();
}

class _ProfileCardsState extends State<ProfileCards> {
  @override
  Widget build(BuildContext context) {
    print(widget.products!);
    return Container(
      width: 305,
      height: 313,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "Order #${widget.idOrder}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "•  ${widget.status}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.black.withAlpha(70),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 109,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, count) =>
                        ProfileOrder(image: "", title: ""),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(),
            SizedBox(
              height: 91,
              width: 257,
              child: Column(
                children: [
                  Text(
                    "Your order is on its way!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Orders will arrive in 3 days!",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 145,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.yellow,
                    ),
                    child: Center(
                      child: Text(
                        "Track",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
