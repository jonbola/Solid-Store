import 'package:card_swiper/card_swiper.dart';
import 'package:eletronic_conponents_store/controllers/dark_mode_controller.dart';
import 'package:eletronic_conponents_store/controllers/language_option_controller.dart';
import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:eletronic_conponents_store/pages/main_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_horizontal_listview.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/manual_vertical_listview.dart';
import 'package:eletronic_conponents_store/tools/functions/change_returnable_page.dart';
import 'package:eletronic_conponents_store/tools/functions/create_image_asset_list.dart';
import 'package:eletronic_conponents_store/tools/functions/create_textbutton_list.dart';
import 'package:eletronic_conponents_store/tools/functions/set_vision_color.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/en_string_values.dart';
import 'package:eletronic_conponents_store/tools/values/object_values.dart';
import 'package:eletronic_conponents_store/tools/values/vn_string_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageFragment extends StatefulWidget {
  final bool isLogin;
  const HomePageFragment(this.isLogin, {super.key});

  @override
  State<HomePageFragment> createState() => _HomePageFragmentState();
}

class _HomePageFragmentState extends State<HomePageFragment> {
  late bool login;
  late DarkModeController darkModeController;
  late MainPage mainPage;

  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    darkModeController = context.read<DarkModeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DarkModeController, LanguageOptionController>(
      builder: (context, darkMode, language, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: whiteColor),
            backgroundColor: setVisionColor(darkMode.status)[0],
            toolbarHeight: 100.0,
            titleSpacing: -10.0,
            title: Row(
              children: <Widget>[
                Image.asset(
                  'resources/images/img_logo.png',
                  height: 70.0,
                  width: 70.0,
                ),
                const CustomText(
                  'SOLID ELECTRONIC',
                  20.0,
                  FontStyle.normal,
                  FontWeight.bold,
                  whiteColor,
                  Alignment.center,
                ),
              ],
            ),
            actions: <Widget>[
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: login
                    ? IconButton(
                        onPressed: changeReturnablePage(
                          context,
                          build,
                          CartPage(darkMode.status),
                        ),
                        icon:
                            Image.asset('resources/icons/ic_shopping_cart.png'),
                      )
                    : IconButton(
                        onPressed: changeReturnablePage(
                          context,
                          build,
                          LoginPage(darkMode.status),
                        ),
                        icon: Image.asset('resources/icons/ic_login.png'),
                      ),
              ),
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
                      null),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomText(
                    language.language == 'VN' ? 'SẢN PHẨM MỚI' : 'NEW PRODUCT',
                    30.0,
                    FontStyle.normal,
                    FontWeight.bold,
                    setVisionColor(darkMode.status)[2],
                    Alignment.centerLeft,
                  ),
                  Card(
                    color: setVisionColor(darkMode.status)[0],
                    child: CustomHorizontalListview(
                        createImageAssetList(productTestDataList, 300.0, 300.0),
                        300.0,
                        AxisDirection.left,
                        true,
                        true,
                        500,
                        SwiperLayout.STACK,
                        300.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomText(
                    language.language == 'VN'
                        ? 'Sản phẩm bán chạy'
                        : 'Hot sale',
                    20.0,
                    FontStyle.normal,
                    FontWeight.normal,
                    setVisionColor(darkMode.status)[2],
                    Alignment.centerLeft,
                  ),
                  Card(
                    color: setVisionColor(darkMode.status)[0],
                    child: CustomHorizontalListview(
                        createImageAssetList(productTestDataList, 200.0, 200.0),
                        200.0,
                        AxisDirection.left,
                        true,
                        true,
                        500,
                        SwiperLayout.STACK,
                        200.0),
                  ),
                  CustomText(
                    language.language == 'VN' ? 'Khuyến mãi' : 'Hot deal',
                    20.0,
                    FontStyle.normal,
                    FontWeight.normal,
                    setVisionColor(darkMode.status)[2],
                    Alignment.centerLeft,
                  ),
                  Card(
                    color: setVisionColor(darkMode.status)[0],
                    child: CustomHorizontalListview(
                        createImageAssetList(productTestDataList, 200.0, 200.0),
                        200.0,
                        AxisDirection.left,
                        true,
                        true,
                        500,
                        SwiperLayout.STACK,
                        200.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
