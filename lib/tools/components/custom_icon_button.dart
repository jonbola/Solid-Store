import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final AlignmentGeometry align;
  final Function()? function;
  final Widget graphicWidget;
  const CustomIconButton(this.buttonWidth, this.buttonHeight, this.align,
      this.function, this.graphicWidget,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: IconButton(
          onPressed: function,
          icon: graphicWidget,
        ),
      ),
    );
  }
}
