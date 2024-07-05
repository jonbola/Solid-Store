import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  final int currentPage;
  final Function(int)? function;
  final List<Widget> graphicList;
  final List<String> buttonLabelList;
  const CustomBottomNavigatorBar(
      this.currentPage, this.function, this.graphicList, this.buttonLabelList,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
      onTap: function,
      items: <BottomNavigationBarItem>[
        for (Widget item in graphicList)
          BottomNavigationBarItem(
            icon: item,
          ),
      ],
    );
  }
}
