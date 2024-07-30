import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/manual_vertical_listview.dart';
import 'package:eletronic_conponents_store/tools/components/product_card.dart';
import 'package:eletronic_conponents_store/tools/functions/change_returnable_page.dart';
import 'package:eletronic_conponents_store/tools/functions/create_textbutton_list.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/en_string_values.dart';
import 'package:eletronic_conponents_store/tools/values/product_list_value.dart';
import 'package:eletronic_conponents_store/tools/values/vn_string_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:eletronic_conponents_store/models/product.dart';

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
    final TextEditingController controller = TextEditingController();
    return Consumer2<DarkModeController, LanguageOptionController>(
      builder: (context, darkMode, language, child) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: whiteColor),
          backgroundColor: setVisionColor(darkMode.status)[0],
          title: Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 40.0),
              child: CustomText(
                  language.language == 'VN' ? 'TÌM KIẾM' : 'SEARCH',
                  30.0,
                  FontStyle.normal,
                  FontWeight.bold,
                  whiteColor,
                  Alignment.center),
            ),
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
          backgroundColor: setVisionColor(darkMode.status)[0],
          width: 150.0,
          child: Column(
            children: <Widget>[
              CustomText(
                language.language == 'VN' ? 'Loại sản phẩm' : 'Product type',
                20.0,
                FontStyle.normal,
                FontWeight.bold,
                whiteColor,
                Alignment.center,
              ),
              ManualVerticalListview(
                createTextButtonList(
                  language.language == 'VN'
                      ? vnProductTypeList
                      : enProductTypeList,
                  100.0,
                  50.0,
                  whiteColor,
                  15.0,
                  FontStyle.normal,
                  FontWeight.normal,
                  blackColor,
                  Alignment.center,
                  null,
                  // () => setState(() {
                  //       controller.text = 'CPU';
                  //     })),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SearchableList<Product>(
            searchTextController: controller,
            initialList: productList,
            inputDecoration: InputDecoration(
              labelText: language.language == 'VN'
                  ? 'Tìm kiếm sản phẩm'
                  : 'Search products',
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
              return ProductCard(product, language.language);
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
