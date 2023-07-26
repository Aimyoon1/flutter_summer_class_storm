import 'package:flutter/material.dart';

class GradientLetter extends StatelessWidget {
  final String letter;
  final double containerWidth,
      containerHeight,
      textContainerWidth,
      textContainerHeight,
      fontHeight,
      fontsize,
      textContainerRadius,
      marginRight,
      containerRadius;

  const GradientLetter(
      {super.key,
      required this.letter,
      required this.containerHeight,
      required this.containerWidth,
      required this.containerRadius,
      required this.fontHeight,
      required this.fontsize,
      required this.textContainerHeight,
      required this.textContainerWidth,
      required this.marginRight,
      required this.textContainerRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight, bottom: marginRight),
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerRadius),
          color: const Color(0xFFFF9002)),
      child: FractionallySizedBox(
        widthFactor: textContainerWidth,
        heightFactor: textContainerHeight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(textContainerRadius),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [-0.025, 1.6875],
                  transform: GradientRotation(180),
                  colors: [Color.fromRGBO(255, 144, 2, 0), Color(0xFFE48000)])),
          child: Center(
            child: Text(
              letter,
              style: TextStyle(
                  fontSize: fontsize,
                  height: 52 / fontHeight,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
