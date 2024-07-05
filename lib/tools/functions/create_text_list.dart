import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:flutter/material.dart';

List<Widget> createTextList(
    List<String> stringList,
    double textSize,
    FontStyle textStyle,
    FontWeight textWeight,
    Color textColor,
    AlignmentGeometry textAlignment) {
  List<Widget> widgetList = <Widget>[];
  Widget widget;
  for (String item in stringList) {
    widget = CustomText(
        item, textSize, textStyle, textWeight, textColor, textAlignment);
    widgetList.add(widget);
  }
  return widgetList;
}
