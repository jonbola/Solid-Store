import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CustomHorizontalListview extends StatelessWidget {
  final List<Widget> widgetList;
  final double listHeight;
  final AxisDirection scrollDirection;
  final bool isLoop;
  final bool isAutoPlay;
  final int breakDuration;
  final SwiperLayout layoutType;
  final double itemWidth;
  final Function(int)? function;
  const CustomHorizontalListview(
      this.widgetList,
      this.listHeight,
      this.scrollDirection,
      this.isLoop,
      this.isAutoPlay,
      this.breakDuration,
      this.layoutType,
      this.itemWidth,
      this.function,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: Swiper(
        onTap: function,
        scrollDirection: Axis.horizontal,
        axisDirection: scrollDirection,
        loop: isLoop,
        autoplay: isAutoPlay,
        duration: breakDuration,
        layout: layoutType,
        itemWidth: itemWidth,
        itemCount: widgetList.length,
        itemBuilder: (context, index) {
          Widget widget = widgetList[index];
          return ListTile(
            title: widget,
          );
        },
      ),
    );
  }
}
