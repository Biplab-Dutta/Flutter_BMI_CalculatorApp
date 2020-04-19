//import 'package:bmi_calculator/Container_Icons/inputPage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Buttons/bottomButton.dart';
import 'repeatedContainer.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.getText, @required this.value, @required this.statement});
  final String getText;
  final String value;
  final String statement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: RepeatedContainer(
                colour: kActiveCardColor,
                cardStyle: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      getText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 110,
                      ),
                    ),
                    Text(
                      statement,
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                tap: () {
                  Navigator.pop(context);
                },
                stringText: 'RE-CALCULATE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
