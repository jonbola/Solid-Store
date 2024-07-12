import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/manual_vertical_listview.dart';
import 'package:eletronic_conponents_store/tools/functions/change_returnable_page.dart';
import 'package:eletronic_conponents_store/tools/functions/create_text_list.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/en_string_values.dart';
import 'package:eletronic_conponents_store/tools/values/vn_string_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:eletronic_conponents_store/database/product_data.dart';

class SearchPageFragment extends StatefulWidget {
  final bool isLogin;
  const SearchPageFragment(this.isLogin, {super.key});

  @override
  State<SearchPageFragment> createState() => _SearchPageFragmentState();
}

class _SearchPageFragmentState extends State<SearchPageFragment> {
  late bool login;
  final searchFieldController = TextEditingController();
  late DarkModeController darkModeController;

  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    darkModeController = context.read<DarkModeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DarkModeController,LanguageOptionController>(
      builder: (context, darkMode,language, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: setVisionColor(darkMode.status)[0],
          title: const Align(
            alignment: Alignment.center,
            child: CustomText('SHOPPING', 30.0, FontStyle.normal,
                FontWeight.bold, whiteColor, Alignment.center),
          ),
          actions: <Widget>[
            login
                ? SizedBox(
                    child: IconButton(
                      onPressed: changeReturnablePage(
                        context,
                        build,
                        CartPage(darkMode.status),
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
                  language.language=='VN'?vnProductTypeList:enProductTypeList,
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
              labelStyle: TextStyle(color: setVisionColor(darkMode.status)[2]),
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
      ),
    );
  }
}

List<Product> productList = [
  Product(id: 01, name: 'CPU', price: 100.0, description: 'Main core'),
  Product(id: 02, name: 'GPU', price: 200.0, description: 'Main graphic'),
];
