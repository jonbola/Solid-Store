import 'package:eletronic_conponents_store/tools/values/colors.dart';
import 'package:eletronic_conponents_store/tools/values/string_style.dart';
import 'package:flutter/material.dart';

class ProductItemFragment extends StatefulWidget {
  final String imageDic;
  const ProductItemFragment(this.imageDic, {super.key});

  @override
  State<ProductItemFragment> createState() => _ProductItemFragmentState();
}

class _ProductItemFragmentState extends State<ProductItemFragment> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          widget.imageDic,
          width: 100.0,
          height: 100.0,
        ),
        const Text(
          'Tên sản phẩm',
          style: blackText,
        ),
        const SizedBox(
          width: 50.0,
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton.outlined(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            icon: Image.asset('resources/icons/ic_minus.png'),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Container(
          width: 30.0,
          decoration:
              BoxDecoration(border: Border.all(width: 1.0, color: black)),
          child: Container(
            margin: const EdgeInsets.only(left: 2.0),
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton.outlined(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            icon: Image.asset('resources/icons/ic_plus.png'),
          ),
        ),
      ],
    );
  }
}
