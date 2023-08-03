import 'package:flutter/material.dart';

class RubikText extends StatelessWidget {
  final TextAlign textAlign;
  final double size;
  final String text;
  final Color textColor;
  final FontWeight fontWeight;

  const RubikText(
      {super.key,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w400,
      required this.text,
      this.textColor = Colors.white,
      this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: size,
          color: textColor,
          fontFamily: 'Rubik',
          fontWeight: fontWeight),
    );
  }
}
