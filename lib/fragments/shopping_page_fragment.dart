import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/manual_vertical_listview.dart';
import 'package:eletronic_conponents_store/tools/functions/change_returnable_page.dart';
import 'package:eletronic_conponents_store/tools/functions/create_text_list.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/object_values.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:eletronic_conponents_store/database/product_data.dart';

class ShoppingPageFragment extends StatefulWidget {
  final bool isLogin;
  final bool visionStatus;
  const ShoppingPageFragment(this.isLogin, this.visionStatus, {super.key});

  @override
  State<ShoppingPageFragment> createState() => _ShoppingPageFragmentState();
}

class _ShoppingPageFragmentState extends State<ShoppingPageFragment> {
  late bool login;
  late bool visionStatus;
  final searchFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    visionStatus = widget.visionStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'SHOPPING',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        actions: <Widget>[
          login
              ? SizedBox(
                  child: IconButton(
                    onPressed: changeReturnablePage(
                      context,
                      build,
                      CartPage(visionStatus),
                    ),
                    icon: Image.asset('resources/icons/ic_shopping_cart.png'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      drawer: Drawer(
        width: 150.0,
        child: Column(
          children: <Widget>[
            const CustomText(
              'Loại sản phẩm',
              20.0,
              FontStyle.normal,
              FontWeight.bold,
              blackColor,
              Alignment.center,
            ),
            ManualVerticalListview(
              createTextList(
                productTypeList,
                20.0,
                FontStyle.normal,
                FontWeight.normal,
                blackColor,
                Alignment.center,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SearchableList<Product>(
          initialList: productList,
          inputDecoration: InputDecoration(
            labelText: "Tìm kiếm sản phẩm",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          filter: (query) {
            return productList
                .where((element) => element.name.contains(query))
                .toList();
          },
          itemBuilder: (Product product) {
            return ProductItem(product);
          },
          sortWidget: const Icon(Icons.sort),
          sortPredicate: (a, b) {
            return a.name.compareTo(b.name);
          },
        ),
      ),
    );
  }
}

List<Product> productList = [
  Product(id: 01, name: 'CPU', price: 100.0, description: 'Main core'),
  Product(id: 02, name: 'GPU', price: 200.0, description: 'Main graphic'),
];
