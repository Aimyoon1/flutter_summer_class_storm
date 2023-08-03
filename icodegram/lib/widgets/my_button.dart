import 'package:flutter/material.dart';
import 'package:icodegram/utils/utility.dart';

class MyButton extends StatelessWidget {
  final Function action;
  final String text;
  final Color textColor;
  final bool gradientColor;

  const MyButton(
      {super.key,
      required this.action,
      required this.text,
      this.textColor = Colors.white,
      required this.gradientColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (kDebugMode) {
        //   print('aa');
        // }
        action();
      },
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: gradientColor ? iCodePrimaryLinearGradient : null),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
