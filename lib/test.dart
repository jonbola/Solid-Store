import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class sss extends StatefulWidget {
  const sss({super.key});

  @override
  State<sss> createState() => _sssState();
}

class _sssState extends State<sss> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> list = <Widget>[
      Text('ssss'),
      Text('ssssssss'),
      Text('ssdadsaj')
    ];
    return Scaffold(
      body: SizedBox(
        width: 500.0,
        child: ScrollLoopAutoScroll(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 500.0,
            child: Row(
              children: <Widget>[const Text('sadsad'),const SizedBox(width: 20.0,),const Text('sdasdas'),],
            ),
          ),
        ),
      ),
    );
  }
}
