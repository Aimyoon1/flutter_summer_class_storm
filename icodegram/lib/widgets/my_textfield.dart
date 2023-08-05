import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color focusedBorderColor, enabledBorderColor;
  final double borderRadius, contentPadding;
  final int maxLines;
  final String text;
  final bool obscureText;
  final Color fillColor;
  const MyTextField(
      {super.key,
      required this.controller,
      this.enabledBorderColor = const Color(0xffa0a0a0),
      this.focusedBorderColor = Colors.white,
      this.fillColor = const Color(0xff121212),
      this.contentPadding = 15,
      this.borderRadius = 10,
      this.maxLines = 1,
      required this.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding),
          hintText: text,
          hintStyle: const TextStyle(color: Color(0xffA0A0A0), fontSize: 15),
          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(width: 1, color: enabledBorderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(width: 1, color: focusedBorderColor))),
    );
  }
}
