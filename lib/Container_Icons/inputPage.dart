import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Buttons/bottomButton.dart';
import 'package:bmi_calculator/Buttons/circleButtons.dart';
import 'package:bmi_calculator/Container_Icons/iconContent.dart';
import 'package:bmi_calculator/constants.dart';
import 'repeatedContainer.dart';
import 'resultPage.dart';
import 'package:bmi_calculator/finalResult.dart';

enum Gender { male, female }
int height = 200;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RepeatedContainer(
                    colour: gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardStyle: MyIcon(
                      myicon: FontAwesomeIcons.mars,
                      mytext: 'MALE',
                    ),
                    onPress: () {
                      setState(
                        () {
                          gender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: RepeatedContainer(
                    colour: gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardStyle: MyIcon(
                      myicon: FontAwesomeIcons.venus,
                      mytext: 'FEMALE',
                    ),
                    onPress: () {
                      setState(
                        () {
                          gender = Gender.female;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RepeatedContainer(
              colour: (kActiveCardColor),
              cardStyle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(width: 3),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 300,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          height = newValue.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RepeatedContainer(
                    colour: (kActiveCardColor),
                    cardStyle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'kg',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularButton(
                                circleIcon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 15,
                            ),
                            CircularButton(
                              circleIcon: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatedContainer(
                    colour: (kActiveCardColor),
                    cardStyle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(width: 3),
                            Text(
                              'yrs',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularButton(
                              circleIcon: Icons.remove,
                              onPress: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CircularButton(
                              circleIcon: Icons.add,
                              onPress: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            tap: () {
              FinalResult res = FinalResult(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    value: res.calculateBMI(),
                    getText: res.getResult(),
                    statement: res.getFeedback(),
                  ),
                ),
              );
            },
            stringText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
