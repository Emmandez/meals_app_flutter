import 'package:flutter/material.dart';


class MealProperty extends StatelessWidget {

  final int icon;
  final dynamic property;
  final String text;

  MealProperty({
    this.icon,
    this.property,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(IconData(icon, fontFamily: 'MaterialIcons')),
        SizedBox(width: 6,),
        Text('$property $text')
      ],
    );
  }
}