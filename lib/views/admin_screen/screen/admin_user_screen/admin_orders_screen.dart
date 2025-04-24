import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/order_model.dart';
import 'package:flutter_3_oy_imtixon/views/admin_screen/admin_user_view_model/admin_user_view_model.dart';

class AdminOrdersScreen extends StatefulWidget {
  final List<OrderModel> orders;
  final String userId; // Add this!
  const AdminOrdersScreen(
      {super.key, required this.orders, required this.userId});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  late List<OrderModel> orders;
  final adminUserViewModel = AdminUserViewModel();

  final List<String> statuses = [
    "pending",
    "processing",
    "shipped",
    "delivered",
    "cancelled",
  ];

  @override
  void initState() {
    super.initState();
    orders = widget.orders;
  }

  void changeOrderStatus(int index, String newStatus) async {
    final orderId = orders[index].id;

    setState(() {
      orders[index] = OrderModel(
        id: orders[index].id,
        createdAt: orders[index].createdAt,
        deliveryAddress: orders[index].deliveryAddress,
        paymentMethod: orders[index].paymentMethod,
        products: orders[index].products,
        status: newStatus,
        total: orders[index].total,
      );
    });

    await adminUserViewModel.updateOrderStatus(
      userId: widget.userId,
      orderId: orderId,
      newStatus: newStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Orders")),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              title: Text("Order ID: ${order.id}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total: \$${order.total.toStringAsFixed(2)}"),
                  Text("Payment: ${order.paymentMethod}"),
                  Text("Address: ${order.deliveryAddress}"),
                  Text("Created: ${order.createdAt.toLocal()}"),
                ],
              ),
              trailing: DropdownButton<String>(
                value: order.status,
                onChanged: (String? newStatus) {
                  if (newStatus != null) {
                    changeOrderStatus(index, newStatus);
                  }
                },
                items: statuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
