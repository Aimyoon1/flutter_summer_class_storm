import 'package:flutter/material.dart';

class MyGradientText extends StatelessWidget {
  final FontWeight fontWeight;
  final String text;
  final double size;

  const MyGradientText(
      {super.key,
      required this.text,
      this.size = 15,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Rubik',
          fontWeight: fontWeight,
          // letterSpacing: 0.6,
          fontSize: size,
          foreground: Paint()
            ..shader = const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0661, 0.761],
                    transform: GradientRotation(88.82),
                    colors: [Color(0xffe86b02), Color(0xfffa9541)])
                .createShader(const Rect.fromLTWH(0, 0, 200.0, 70.0))),
    );
  }
}
