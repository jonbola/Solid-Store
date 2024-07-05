import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final double textFieldWidth;
  final double textFieldHeight;
  final bool isEnabled;
  final String textFieldLabel;
  const CustomTextfield(this.textFieldWidth, this.textFieldHeight,
      this.isEnabled, this.textFieldLabel,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        enabled: isEnabled,
        decoration: InputDecoration(hintText: textFieldLabel),
      ),
    );
  }
}
