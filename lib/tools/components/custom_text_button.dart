import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final Color buttonColor;
  final Widget textWidget;
  final Function()? function;
  const CustomTextButton(this.buttonWidth, this.buttonHeight, this.buttonColor,
      this.textWidget, this.function,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonColor),
        ),
        onPressed: function,
        child: textWidget,
      ),
    );
  }
}
