import 'package:eletronic_conponents_store/tools/components/custom_icon_button.dart';
import 'package:flutter/material.dart';

List<Widget> createIconButtonList(
    List<String> stringList,
    double buttonWidth,
    double buttonHeight,
    AlignmentGeometry align,
    List<Widget> graphicList,
    Function()? function) {
  List<Widget> widgetList = <Widget>[];
  Widget widget;
  for (Widget item in graphicList) {
    widget = CustomIconButton(buttonWidth, buttonHeight, align, item, function);
    widgetList.add(widget);
  }
  return widgetList;
}
