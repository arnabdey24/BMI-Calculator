import 'package:flutter/material.dart';
class OurCard extends StatelessWidget {
  final Color colour;
  final Widget child;
  final int marginSize;

  OurCard({@required this.colour, this.child,this.marginSize=10});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(marginSize.toDouble()),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}