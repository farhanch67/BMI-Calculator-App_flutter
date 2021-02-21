import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class IconTop extends StatelessWidget {
  const IconTop({Key key, @required this.label, @required this.icon})
      : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}