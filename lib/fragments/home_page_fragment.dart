import 'package:eletronic_conponents_store/pages/cart_page.dart';
import 'package:eletronic_conponents_store/pages/login_page.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/manual_horizontal_listview.dart';
import 'package:eletronic_conponents_store/tools/components/manual_vertical_listview.dart';
import 'package:eletronic_conponents_store/tools/functions/change_returnable_page.dart';
import 'package:eletronic_conponents_store/tools/functions/convert_to_iconbutton.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:eletronic_conponents_store/tools/values/object_values.dart';
import 'package:flutter/material.dart';

class HomePageFragment extends StatefulWidget {
  final bool isLogin;
  const HomePageFragment(this.isLogin, {super.key});

  @override
  State<HomePageFragment> createState() => _HomePageFragmentState();
}

class _HomePageFragmentState extends State<HomePageFragment> {
  late List<Widget> objectList;
  @override
  void initState() {
    super.initState();
    objectList = <Widget>[];
    convertToIconButton(objectList, productTestData, null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          titleSpacing: -10.0,
          title: Row(
            children: <Widget>[
              Image.asset(
                'resources/images/img_logo.png',
                height: 70.0,
                width: 70.0,
              ),
              const CustomText('SOLID ELECTRONIC', 20.0, FontStyle.normal,
                  FontWeight.bold, blackColor, Alignment.center),
            ],
          ),
          actions: <Widget>[
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: widget.isLogin
                  ? IconButton(
                      onPressed: () {
                        changeReturnablePage(context, build, const CartPage());
                      },
                      icon: Image.asset('resources/icons/ic_shopping_cart.png'))
                  : IconButton(
                      onPressed: () {
                        changeReturnablePage(context, build, const LoginPage());
                      },
                      icon: Image.asset('resources/icons/ic_exit.png')),
            ),
          ],
        ),
        drawer: Drawer(
          width: 150.0,
          child: Column(
            children: <Widget>[
              const CustomText('Loại sản phẩm', 20.0, FontStyle.normal,
                  FontWeight.bold, blackColor, Alignment.center),
              ManualVerticalListview(objectList, 50.0, 50.0),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const CustomText('SẢN PHẨM MỚI', 30.0, FontStyle.normal,
                  FontWeight.bold, blackColor, Alignment.centerLeft),
              ManualHorizontalListview(objectList,300.0, 300.0, 300.0),
              const SizedBox(
                height: 20.0,
              ),
              const CustomText('Sản phẩm bán chạy', 20.0, FontStyle.normal,
                  FontWeight.normal, blackColor, Alignment.centerLeft),
              ManualHorizontalListview(objectList,200.0, 200.0, 200.0),
            ],
          ),
        ),
      ),
    );
  }
}
