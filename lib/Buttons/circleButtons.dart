import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({this.circleIcon, this.onPress});
  final IconData circleIcon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPress,
      backgroundColor: Color(0xFF4C4F5E),
      child: Icon(
        circleIcon,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
