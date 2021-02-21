import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Reuseable-Cards.dart';
import 'package:bmi_calculator/Icons_file.dart';
import 'package:bmi_calculator/constants.dart';
import 'Result.dart';
import 'Calculations.dart';

Gender selectedGender;
enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 180;
int weight = 60;
int age = 18;

// Color malecardcolor = inactivecardcolor;
// Color femalecardcolor = inactivecardcolor;
//
// void updatcolor(Gender gen){
//   if(gen== Gender.Male) {
//     if (malecardcolor == inactivecardcolor) {
//       malecardcolor = activecardcolor;
//       femalecardcolor = inactivecardcolor;
//     }
//     else {
//       malecardcolor = inactivecardcolor;
//     }
//   }
//   if(gen==Gender.Female){
//     if (femalecardcolor == inactivecardcolor) {
//       femalecardcolor = activecardcolor;
//       malecardcolor = inactivecardcolor;
//     }
//     else {
//       femalecardcolor = inactivecardcolor;
//     }
//   }
// }
class _InputPageState extends State<InputPage> {
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
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResueableCard(
                    // Colour: Color(0xFF1D1E33),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male
                        ? activecardcolor
                        : inactivecardcolor,
                    cardChild: IconTop(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ResueableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    colour: selectedGender == Gender.Female
                        ? activecardcolor
                        : inactivecardcolor,
                    cardChild: IconTop(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.female,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ResueableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.teal,
                      activeTrackColor: Colors.white,
                      overlayColor: Colors.white10,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour: Colors.teal.shade700,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResueableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: Colors.teal.shade700,
                  ),
                ),
                Expanded(
                  child: ResueableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: Colors.teal.shade700,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculations cal = Calculations(weight: weight, height: height);
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      bmiResult: cal.calulateBMI(),
                      interpretations: cal.interpretation(),
                      status: cal.getResult(),
                    ),

                  ),
                );
              });
            },
            child: Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.teal.shade900,
                // width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  RoundActionButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 40.0,
        width: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.teal,
    );
  }
}
