import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final double textFieldWidth;
  final double textFieldHeight;
  final bool isEnabled;
  final String textFieldLabel;
  final Color colorTextFieldLabel;
  const CustomTextfield(this.textFieldWidth, this.textFieldHeight,
      this.isEnabled, this.textFieldLabel, this.colorTextFieldLabel,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        enabled: isEnabled,
        decoration: InputDecoration(
            hintText: textFieldLabel,
            hintStyle: TextStyle(color: colorTextFieldLabel),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: blackColor))),
      ),
    );
  }
}
