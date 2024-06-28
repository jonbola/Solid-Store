import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String textValue;
  final double textSize;
  final FontStyle textStyle;
  final FontWeight textWeight;
  final Color textColor;
  final AlignmentGeometry textAlignment;
  const CustomText(this.textValue, this.textSize, this.textStyle,
      this.textWeight, this.textColor, this.textAlignment,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: textAlignment,
      child: Text(
        textValue,
        style: TextStyle(
          fontSize: textSize,
          fontStyle: textStyle,
          fontWeight: textWeight,
          color: textColor,
        ),
      ),
    );
  }
}
