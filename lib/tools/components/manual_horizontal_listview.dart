import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class ManualHorizontalListview extends StatelessWidget {
  final List objectList;
  final double listHeight;
  final double itemWidth;
  final double itemHeight;
  const ManualHorizontalListview(
      this.objectList,this.listHeight, this.itemWidth, this.itemHeight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: LiveList.options(
        scrollDirection: Axis.horizontal,
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
