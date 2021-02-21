import 'package:flutter/material.dart';
import 'dart:math';

class Calculations {
  Calculations({this.weight, this.height});
  final int weight;
  final int height;

  double bmi=0;
  String calulateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Over Weight';
    } else if (bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String interpretation()
  {
    if(bmi>=25){
      return 'You have Higher then normal body weight';
    }else if(bmi>18){
      return 'You have the normal body weight';
    }else {
      return 'You have Lower then normal body weight';
    }
  }
}
