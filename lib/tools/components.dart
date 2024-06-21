import 'package:flutter/material.dart';

class LeftText extends StatelessWidget {
  final String labelText;
  final TextStyle styleText;
  const LeftText(this.labelText, this.styleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: styleText,
      ),
    );
  }
}

class RightText extends StatelessWidget {
  final String labelText;
  final TextStyle styleText;
  const RightText(this.labelText, this.styleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        labelText,
        style: styleText,
      ),
    );
  }
}

class MiddleText extends StatelessWidget {
  final String labelText;
  final TextStyle styleText;
  const MiddleText(this.labelText, this.styleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        labelText,
        style: styleText,
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  final List<String> imageList;
  const HorizontalListView(this.imageList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var value in imageList) Image.asset(value),
        ],
      ),
    );
  }
}

class VerticalListView extends StatelessWidget {
  final List<String> imageList;
  const VerticalListView(this.imageList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          for (var value in imageList) Image.asset(value),
        ],
      ),
    );
  }
}
