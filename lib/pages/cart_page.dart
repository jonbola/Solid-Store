import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/model/cart.dart'; // Import your CartProvider
import '../tools/components/custom_text.dart';
import '../tools/values/color_values.dart';
import '../tools/functions/change_returnable_page.dart';
import '../pages/main_page.dart';

class CartPage extends StatefulWidget {
  final bool isDarkModeOn;
  const CartPage(this.isDarkModeOn, {super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late bool darkMode;

  @override
  void initState() {
    super.initState();
    darkMode = widget.isDarkModeOn;
  }

  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận thanh toán'),
          content: Text('Bạn có chắc chắn muốn hoàn tất thanh toán với tổng số tiền là ${Provider.of<CartProvider>(context, listen: false).totalAmount} VNĐ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _createOrder(); // Proceed with order creation
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  void _createOrder() {

    // Show a success message or navigate to another page if needed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đơn hàng của bạn đã được tạo thành công!')),
    );

    // You can save the order to your database or perform other actions here
    // saveOrderToDatabase(order);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: lightBlueColor,
          title: const CustomText(
            'GIỎ HÀNG',
            30.0,
            FontStyle.normal,
            FontWeight.bold,
            whiteColor,
            Alignment.center,
          ),
        ),
        body: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(
                    'Danh sách sản phẩm',
                    20.0,
                    FontStyle.normal,
                    FontWeight.normal,
                    blackColor,
                    Alignment.centerLeft,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartProvider.items.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.items[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 80.0, // Fixed width for image
                                child: item.image.isNotEmpty
                                    ? Image.network(item.image, fit: BoxFit.cover)
                                    : const Placeholder(),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.productName,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        color: blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Price: ${item.price} VNĐ x ${item.quantity}',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        color: blackColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100.0, // Fixed width for price
                                child: Text(
                                  '${item.totalPrice} VNĐ',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove, color: Colors.red),
                                onPressed: () {
                                  cartProvider.decreaseQuantity(item.id); // Use 'id'
                                },
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.green),
                                onPressed: () {
                                  cartProvider.increaseQuantity(item.id); // Use 'id'
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Container(
              height: 70.0,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'Tổng tiền: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: blackColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          '${cartProvider.totalAmount} VNĐ',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: blackColor,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(blueColor),
                            ),
                            onPressed: changeReturnablePage(
                              context,
                              build,
                              const MainPage(false,true),
                            ),
                            child: const Text(
                              'Tiếp tục mua sắm',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                color: whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: SizedBox(
                          height: 40.0,
                          child: TextButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(blueColor),
                            ),
                            onPressed: _showCheckoutDialog, // Show confirmation dialog
                            child: const Text(
                              'Thanh toán',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                color: whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
