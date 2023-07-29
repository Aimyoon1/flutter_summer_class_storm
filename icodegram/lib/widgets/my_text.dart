import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final bool isGradientText;
  final double size;
  final Color textColor;

  const MyText(
      {super.key,
      required this.text,
      this.isGradientText = false,
        this.textColor =  Color(0xffA0A0A0),
        this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: isGradientText ? null : textColor,
          foreground: Paint()
            ..shader = isGradientText ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0661, 0.761],
                    transform: GradientRotation(88.82),
                    colors: [Color(0xffe86b02), Color(0xfffa9541)])
                .createShader(const Rect.fromLTWH(0, 0, 200.0, 70.0)) : null),
    );
  }
}
