import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/components/custom_text_button.dart';
import 'package:flutter/material.dart';

List<Widget> createTextButtonList(
    List<String> stringList,
    double buttonWidth,
    double buttonHeight,
    Color buttonColor,
    double textSize,
    FontStyle textStyle,
    FontWeight textWeight,
    Color textColor,
    AlignmentGeometry textAlignment,
    Function()? function) {
  List<Widget> widgetList = <Widget>[];
  Widget widget;
  for (String item in stringList) {
    widget = CustomTextButton(
      buttonWidth,
      buttonHeight,
      buttonColor,
      CustomText(
        item,
        textSize,
        textStyle,
        textWeight,
        textColor,
        textAlignment,
      ),
      function,
    );
    widgetList.add(widget);
  }
  return widgetList;
}
