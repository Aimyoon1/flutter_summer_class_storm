import 'package:flutter/material.dart';

class BackgroundImg extends StatelessWidget {
  final String backgroundImg;
  const BackgroundImg({super.key, required this.backgroundImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundImg), fit: BoxFit.cover),
      ),
    );
  }
}
