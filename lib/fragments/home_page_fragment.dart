import 'package:card_swiper/card_swiper.dart';
import 'package:eletronic_conponents_store/fragments/home_page_controller.dart';
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
import 'package:eletronic_conponents_store/tools/values/object_values.dart';
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
  late Color mainColor;
  late Color backgroundColor;
  late Color textColor;
  late MainPage mainPage;
  @override
  void initState() {
    super.initState();
    login = widget.isLogin;
    final controller = context.read<HomePageController>();
    final setColor = setVisionColor(controller.visionStatus);
    mainColor = setColor[0];
    backgroundColor = setColor[1];
    textColor = setColor[2];
  }

  Widget body() {
    return Consumer<HomePageController>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
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
                          CartPage(value.visionStatus),
                        ),
                        icon:
                            Image.asset('resources/icons/ic_shopping_cart.png'),
                      )
                    : IconButton(
                        onPressed: changeReturnablePage(
                          context,
                          build,
                          LoginPage(value.visionStatus),
                        ),
                        icon: Image.asset('resources/icons/ic_exit.png'),
                      ),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: value.visionStatus == true ? whiteColor : Colors.black,
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
                  createTextButtonList(
                      productTypeList,
                      100.0,
                      50.0,
                      lightBlueColor,
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
                  const CustomText(
                    'SẢN PHẨM MỚI',
                    30.0,
                    FontStyle.normal,
                    FontWeight.bold,
                    blackColor,
                    Alignment.centerLeft,
                  ),
                  Card(
                    color: mainColor,
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
                  const CustomText(
                    'Sản phẩm bán chạy',
                    20.0,
                    FontStyle.normal,
                    FontWeight.normal,
                    blackColor,
                    Alignment.centerLeft,
                  ),
                  Card(
                    color: mainColor,
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
                  const CustomText(
                    'Khuyến mãi',
                    20.0,
                    FontStyle.normal,
                    FontWeight.normal,
                    blackColor,
                    Alignment.centerLeft,
                  ),
                  Card(
                    color: mainColor,
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

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
