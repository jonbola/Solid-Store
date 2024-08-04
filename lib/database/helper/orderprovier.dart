import 'package:flutter/foundation.dart';
import '../../database/model/order.dart'; // Make sure this path is correct

class OrderProvider extends ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  void fetchOrders() {
    // Replace this with actual data fetching logic
    _orders = [
      OrderModel(orderId: 1, customerId: 1, orderDate: DateTime.now(), totalAmount: 100.0),
      OrderModel(orderId: 2, customerId: 2, orderDate: DateTime.now(), totalAmount: 200.0),
    ];
    notifyListeners();
  }
}
