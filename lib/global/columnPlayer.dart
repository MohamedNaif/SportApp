import 'package:flutter/material.dart';

class ColumnPlayer extends StatelessWidget {
  dynamic icon;
  dynamic color;
  String text;
  ColumnPlayer(
      {super.key, required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 36.0,
          color: color,
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
