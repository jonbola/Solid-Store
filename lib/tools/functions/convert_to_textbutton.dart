import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:flutter/material.dart';

void convertToTextButton(
    List<Widget> objectList,
    List<String> stringList,
    double textSize,
    FontStyle textStyle,
    FontWeight textWeight,
    Color textColor,
    AlignmentGeometry align) {
  Widget widget;
  for (String item in stringList) {
    widget = TextButton(
      onPressed: null,
      child:
          CustomText(item, textSize, textStyle, textWeight, textColor, align),
    );
    objectList.add(widget);
  }
}
