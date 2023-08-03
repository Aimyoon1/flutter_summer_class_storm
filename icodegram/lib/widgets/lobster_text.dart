import 'package:flutter/material.dart';

class LobsterText extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  const LobsterText(
      {super.key,
      required this.text,
      required this.size,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Lobster',
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: textColor),
    );
  }
}
