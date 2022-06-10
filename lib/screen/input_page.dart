import 'package:bmi_calculater/Bottombutton.dart';
import 'package:bmi_calculater/calculator.dart';
import 'package:bmi_calculater/container.dart';
import 'package:bmi_calculater/screen/result.dart';
import 'package:bmi_calculater/roundediconbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI-CALCULATER'),
      ),
      body: Container(child: MyContainer()),
    );
  }
}

class MyContainer extends StatefulWidget {
  MyContainer({
    Key? key,
  }) : super(key: key);

  @override
  _MyContainerState createState() => _MyContainerState();
}

enum Gender { male, female }
Gender? selectedgender;
const activecolor = 0xFF1D1E33;
const inactivecolor = 0xFF111328;
int height = 180;
int weight = 70;
int age = 25;

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: container(
                  onPress: () {
                    setState(() {
                      selectedgender = Gender.male;
                    });
                  },
                  colours: Color(selectedgender == Gender.male
                      ? inactivecolor
                      : activecolor),
                  containerchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 100,
                      ),
                      Text('Male', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: container(
                  onPress: () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  colours: Color(selectedgender == Gender.female
                      ? inactivecolor
                      : activecolor),
                  containerchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 100,
                      ),
                      Text('Female', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: container(
            colours: Color(activecolor),
            containerchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: TextStyle(color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(height.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 50)),
                    Text('cm', style: TextStyle(color: Colors.white))
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x20EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                    min: 120,
                    max: 220,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: container(
                  colours: Color(activecolor),
                  containerchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: TextStyle(color: Colors.white)),
                      Text(weight.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: container(
                  colours: Color(activecolor),
                  containerchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: TextStyle(color: Colors.white)),
                      Text(age.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpress: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        BottomButton(
          title: 'CALCULATE',
          ontap: () {
            calculator calc = calculator(height: height, weight: weight);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => result(
                          bmiresult: calc.calculatebmi(),
                          resulttext: calc.getResult(),
                          Interprator: calc.getInterpretation(),
                        )));
          },
        )
      ],
    );
  }
}
