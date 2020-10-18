import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  final String tag;

  ButtonIcon({this.icon, this.onPress, this.tag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      onPressed: onPress,
      backgroundColor: Colors.blueGrey,
      child: Icon(icon),
      foregroundColor: Colors.white,
    );
  }
}
