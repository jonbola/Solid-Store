import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class AutoHorizontalListView extends StatelessWidget {
  final List objectList;
  final double listHeight;
  final double itemWidth;
  final double itemHeight;
  const AutoHorizontalListView(
      this.objectList, this.listHeight, this.itemWidth, this.itemHeight,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      scrollDirection: Axis.horizontal,
      child: LiveList(
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
          itemCount: objectList.length),
    );
  }
}
