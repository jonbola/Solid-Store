import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test02 extends StatelessWidget {
  final ValueChanged<int> update;
  Test02({required this.update});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => update(100), // Passing value to the parent widget.
      child: Text('Update (in child)'),
    );
  }
}
