import 'package:flutter/material.dart';

List<Widget> createImageAssetList(
    List<String> imageDicList, double imageWidth, double imageHeight) {
  List<Widget> widgetList = <Widget>[];
  Widget widget;
  for (String item in imageDicList) {
    widget = Image.asset(width: imageWidth, height: imageHeight, item);
    widgetList.add(widget);
  }
  return widgetList;
}
