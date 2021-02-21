import 'package:flutter/material.dart';
class ResueableCard extends StatelessWidget {
  const ResueableCard({Key key, @required this.colour, this.cardChild, this.onPress})
      : super(key: key);

  final Color colour;
  // ignore: non_constant_identifier_names
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}