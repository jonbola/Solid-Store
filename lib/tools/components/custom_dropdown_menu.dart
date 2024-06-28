import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final bool isEnabled;
  final List<String> stringList;
  final double menuWidth;
  const CustomDropdownMenu(this.isEnabled, this.stringList, this.menuWidth,
      {super.key});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String currentMenuValue = '';
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      enabled: widget.isEnabled,
      width: widget.menuWidth,
      initialSelection: widget.stringList.first,
      onSelected: (String? value) {
        setState(() {
          currentMenuValue = value!;
        });
      },
      dropdownMenuEntries: widget.stringList.map<DropdownMenuEntry<String>>(
        (String value) {
          return DropdownMenuEntry(value: value, label: value);
        },
      ).toList(),
    );
  }
}
