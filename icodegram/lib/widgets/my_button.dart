import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String  text;
  final Color textColor;
  final bool gradientColor;


  const MyButton({super.key, required this.text, this.textColor = Colors.white, required this.gradientColor });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: gradientColor ? LinearGradient(
            begin: Alignment.centerRight,
            colors: [Color(0xffe86b02), Color(0xfffa9541)]
          ) : null
        ),
        child: Center(child: Text(text, style: TextStyle(color: textColor),),),
      ),
    );
  }
}
