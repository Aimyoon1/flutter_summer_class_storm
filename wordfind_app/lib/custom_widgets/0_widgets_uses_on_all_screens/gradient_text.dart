import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double size;
  const GradientText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
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
