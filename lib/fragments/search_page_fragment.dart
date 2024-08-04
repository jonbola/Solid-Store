// Example usage in SearchPageFragment
import 'package:eletronic_conponents_store/database/model/cart.dart';
import 'package:eletronic_conponents_store/database/model/category.dart';
import 'package:eletronic_conponents_store/tools/functions/create_textbutton_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:eletronic_conponents_store/database/helper/db_helper.dart';
import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/database/model/product.dart';
import 'package:eletronic_conponents_store/database/model/product_data.dart';
import '../pages/product_detail_page.dart';
import '../tools/components/manual_vertical_listview.dart';

class SearchPageFragment extends StatefulWidget {
  final bool isLogin;
  const SearchPageFragment(this.isLogin, {super.key});

  @override
  State<SearchPageFragment> createState() => _SearchPageFragmentState();
}

class _SearchPageFragmentState extends State<SearchPageFragment> {
  late bool login;
  late DarkModeController darkModeController;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    darkModeController = context.read<DarkModeController>();
  }

  Future<List<ProductModel>> _fetchProducts() async {
    final products = await _databaseHelper.getAllProducts();
    return products ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DarkModeController, LanguageOptionController>(
      builder: (context, darkMode, language, child) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: whiteColor),
          backgroundColor: setVisionColor(darkMode.status)[0],
          title: Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 40.0),
              child: const CustomText('SHOPPING', 30.0, FontStyle.normal,
                  FontWeight.bold, whiteColor, Alignment.center),
            ),
          ),
          actions: <Widget>[
            login
                ? Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      final itemCount = cartProvider.items?.length ?? 0;
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CartPage(darkMode.status),
                              ),
                            ),
                            icon: Image.asset(
                                'resources/icons/ic_shopping_cart.png'),
                          ),
                          if (itemCount > 0)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2.0),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  maxWidth: 20.0,
                                  maxHeight: 20.0,
                                ),
                                child: Center(
                                  child: Text(
                                    '$itemCount',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
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
              Expanded(
                child: FutureBuilder<List<CategoryModel>>(
                  future: _databaseHelper
                      .getCategories(), // Fetch categories from local database
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No categories found'));
                    } else {
                      return ManualVerticalListview(
                        createTextButtonList(
                          snapshot.data!
                              .map((category) => category.categoryName)
                              .toList(),
                          100.0,
                          50.0,
                          whiteColor,
                          15.0,
                          FontStyle.normal,
                          FontWeight.normal,
                          blackColor,
                          Alignment.center,
                          null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<ProductModel>>(
            future: _fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products available'));
              } else {
                final filteredProducts = selectedCategory == null
                    ? snapshot.data!
                    : snapshot.data!
                        .where(
                            (product) => product.categoryId == selectedCategory)
                        .toList();

                return SearchableList<ProductModel>(
                  initialList: filteredProducts,
                  inputDecoration: InputDecoration(
                    labelText: language.language == 'VN'
                        ? 'Tìm kiếm sản phẩm'
                        : 'Look for products',
                    labelStyle:
                        TextStyle(color: setVisionColor(darkMode.status)[2]),
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
                    final lowerQuery = query.toLowerCase();
                    return filteredProducts
                        .where((element) => element.productName
                            .toLowerCase()
                            .contains(lowerQuery))
                        .toList();
                  },
                  itemBuilder: (ProductModel product) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(
                              product,
                              login,
                              darkMode.status,
                            ),
                          ),
                        );
                      },
                      child: ProductItem(product),
                    );
                  },
                  sortWidget: const Icon(Icons.sort),
                  sortPredicate: (a, b) {
                    return a.productName.compareTo(b.productName);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
