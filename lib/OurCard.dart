import 'package:flutter/material.dart';
class OurCard extends StatelessWidget {
  final Color colour;
  final Widget child;

  OurCard({@required this.colour, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}