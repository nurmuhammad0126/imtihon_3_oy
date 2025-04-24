import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final String? imageUrl;
  const Order({super.key, required this.imageUrl});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Container(
          height: 108,
          width: 80,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(widget.imageUrl ?? "")))),
    );
  }
}
