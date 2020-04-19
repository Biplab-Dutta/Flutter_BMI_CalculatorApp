import 'package:flutter/material.dart';

class RepeatedContainer extends StatelessWidget {
  RepeatedContainer({@required this.colour, this.cardStyle, this.onPress});
  final Color colour;
  final Widget cardStyle;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardStyle,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
