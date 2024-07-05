import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class ManualVerticalListview extends StatelessWidget {
  final List<Widget> widgetList;
  const ManualVerticalListview(this.widgetList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LiveList.options(
        itemBuilder: (context, index, animation) {
          final widget = widgetList[index];
          return ListTile(
            title: widget,
          );
        },
        itemCount: widgetList.length,
        options: const LiveOptions(
          delay: Duration(seconds: 1),
        ),
      ),
    );
  }
}
