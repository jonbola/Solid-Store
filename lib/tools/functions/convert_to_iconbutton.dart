import 'package:flutter/material.dart';

void convertToIconButton(
    List<Widget> objectList, List<String> stringList, void function) {
  Widget widget;
  for (String item in stringList) {
    widget = IconButton(
      onPressed: () {
        function;
      },
      icon: Image.asset(item),
    );
    objectList.add(widget);
  }
}
