import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class MyIcon extends StatelessWidget {
  final IconData myicon;
  final String mytext;
  MyIcon({this.myicon, this.mytext});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myicon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          mytext,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
