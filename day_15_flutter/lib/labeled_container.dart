import 'package:flutter/material.dart';

class LabeledContainer extends StatelessWidget {
  final double? width, height;
  final Color? color, textColor;
  final String text;
  const LabeledContainer({this.height = double.infinity, this.width, this.color, this.textColor, required this.text });

  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      color : color,
      child: Center(
        child: Text(text, style: TextStyle(color: textColor, fontSize: 20),),
      ),

    );
  }
}