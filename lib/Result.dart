import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmiResult,
      @required this.interpretations,
      @required this.status});
  final String bmiResult;
  final String interpretations;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.teal.shade700,
          child: Text(
            'DEVELOPER   FARHAN ASLAM',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 3,
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              color: Colors.teal,
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiResult.toUpperCase(),
                    style: numStyle.copyWith(color: Colors.white,),
                  ),
                  Text(
                    interpretations,
                    style: labelTextStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    status,
                    style: labelTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
