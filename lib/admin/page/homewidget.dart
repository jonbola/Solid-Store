import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../database/helper/orderprovier.dart';
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          final orders = orderProvider.orders;

          if (orders.isEmpty) {
            return const Center(
              child: Text("No orders available."),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text('Order ID: ${order.orderId}'),
                subtitle: Text('Customer ID: ${order.customerId}\nTotal Amount: ${order.totalAmount}'),
                trailing: Text(order.orderDate.toString()),
              );
            },
          );
        },
      ),
    );
  }
}