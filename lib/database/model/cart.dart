import 'package:flutter/foundation.dart';
import '../model/order.dart'; // Ensure this path is correct based on your project structure

class CartItem {
  final String id;
  final String image;
  final String productName;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.image,
    required this.productName,
    required this.price,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(CartItem item) {
    final existingIndex = _items.indexWhere((i) => i.id == item.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void increaseQuantity(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _items[index].quantity += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0 && _items[index].quantity > 1) {
      _items[index].quantity -= 1;
      notifyListeners();
    } else if (index >= 0) {
      removeItem(id);
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Method to create an order
  OrderModel createOrder(int customerId) {
    final order = OrderModel(
      customerId: customerId,
      orderDate: DateTime.now(),
      totalAmount: totalAmount,
    );

    clearCart(); // Clear the cart after creating the order
    return order;
  }
}
