import 'package:eletronic_conponents_store/tools/components/custom_text.dart';
import 'package:eletronic_conponents_store/tools/values/color_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductItemFragment extends StatefulWidget {
  final String imageDic;
  const ProductItemFragment(this.imageDic, {super.key});

  @override
  State<ProductItemFragment> createState() => _ProductItemFragmentState();
}

late int count;
final textFieldController = TextEditingController();

class _ProductItemFragmentState extends State<ProductItemFragment> {
  @override
  void initState() {
    super.initState();
    count = 1;
    textFieldController.text = count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          widget.imageDic,
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(
          width: 120.0,
          child: CustomText('Tên sản phẩm', 20.0, FontStyle.normal,
              FontWeight.normal, blackColor, Alignment.center),
        ),
        const SizedBox(
          width: 20.0,
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton.outlined(
            onPressed: () {
              setState(() {
                if (count == 1) {
                  null;
                } else {
                  count--;
                  textFieldController.text = count.toString();
                }
              });
            },
            icon: Image.asset('resources/icons/ic_minus.png'),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        SizedBox(
            width: 50.0,
            child: TextField(
              onEditingComplete: () {
                setState(() {
                  count = int.parse(textFieldController.text);
                });
              },
              controller: textFieldController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            )),
        const SizedBox(
          width: 10.0,
        ),
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton.outlined(
            onPressed: () {
              setState(() {
                count++;
                textFieldController.text = count.toString();
              });
            },
            icon: Image.asset('resources/icons/ic_plus.png'),
          ),
        ),
      ],
    );
  }
}
