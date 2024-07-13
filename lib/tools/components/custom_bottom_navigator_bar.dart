import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  final Color backgroundColor;
  final Color unSelectedItemColor;
  final Color selectedItemColor;
  final int currentPage;
  final List<Widget> widgetList;
  final Function()? function;
  const CustomBottomNavigatorBar(this.backgroundColor, this.unSelectedItemColor,
      this.selectedItemColor, this.currentPage, this.widgetList, this.function,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      unselectedItemColor: unSelectedItemColor,
      selectedItemColor: selectedItemColor,
      currentIndex: currentPage,
      onTap: (int index) => function,
      items: <BottomNavigationBarItem>[],
    );
  }
}

Widget getWidget(List<Widget> widgetList) {
  for (var item in widgetList) {
    return item;
  }
}

String getString(List<String> stringList) {
  for (var string in stringList) {
    return string;
  }
}
