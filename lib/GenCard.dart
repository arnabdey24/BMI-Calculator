import 'package:flutter/material.dart';

const textStyle= TextStyle(
fontSize: 18,
color: Colors.grey,
);

class GenCard extends StatelessWidget {
  final IconData icon;
  final String label;

  GenCard({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: textStyle,
        )
      ],
    );
  }
}