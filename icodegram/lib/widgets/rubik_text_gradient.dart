import 'package:flutter/material.dart';
import 'package:icodegram/utils/utility.dart';

class RubikTextWithGradient extends StatelessWidget {
  final TextAlign textAlign;
  final double size;
  final String text;

  final FontWeight fontWeight;

  const RubikTextWithGradient(
      {super.key,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w400,
      required this.text,
      this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: size,
          foreground: Paint()
            ..shader = iCodePrimaryLinearGradient
                .createShader(const Rect.fromLTWH(0, 0, 200.0, 70.0)),
          fontFamily: 'Rubik',
          fontWeight: fontWeight),
    );
  }
}
