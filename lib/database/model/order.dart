// order_model.dart
class OrderModel {
  final int? orderId;
  final int customerId;
  final DateTime orderDate;
  final double totalAmount;

  const OrderModel({
    this.orderId,
    required this.customerId,
    required this.orderDate,
    required this.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json['OrderId'],
        customerId: json['CustomerId'],
        orderDate: DateTime.parse(json['OrderDate']),
        totalAmount: json['TotalAmount'],
      );

  Map<String, dynamic> toJson() => {
        'OrderId': orderId,
        'CustomerId': customerId,
        'OrderDate': orderDate.toIso8601String(),
        'TotalAmount': totalAmount,
      };
      
}
