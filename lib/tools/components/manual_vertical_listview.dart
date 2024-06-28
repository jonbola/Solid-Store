import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class ManualVerticalListview extends StatelessWidget {
  final List objectList;
  final double itemWidth;
  final double itemHeight;
  const ManualVerticalListview(this.objectList, this.itemWidth, this.itemHeight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LiveList.options(
        itemBuilder: (context, index, animation) {
          final object = objectList[index];
          return SizedBox(
            width: itemWidth,
            height: itemHeight,
            child: ListTile(
              title: object,
            ),
          );
        },
        itemCount: objectList.length,
        options: const LiveOptions(
          delay: Duration(seconds: 1),
        ),
      ),
    );
  }
}
