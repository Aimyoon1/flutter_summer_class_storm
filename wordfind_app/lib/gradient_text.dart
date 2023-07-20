import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double size;
  const GradientText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          foreground: Paint()
            ..shader =
                LinearGradient(
                    colors:  [
                      Color(0xFFE86B03),
                      Color(0xFFFA9541),
                    ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1661, 0.361]
                ).createShader(const Rect.fromLTWH(0.5, 0.0, 200.0, 70.0))
      ),
    );
  }
}
