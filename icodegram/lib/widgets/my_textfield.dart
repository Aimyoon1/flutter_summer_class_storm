import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final double borderRadius, contentPadding;
  final int maxLines;
  final String text;
  final bool obscureText;
  const MyTextField(
      {super.key,
      this.contentPadding = 15,
      this.borderRadius = 10,
      this.maxLines = 1,
      required this.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding),
          hintText: text,
          hintStyle: const TextStyle(color: Color(0xffA0A0A0), fontSize: 15),
          filled: true,
          fillColor: const Color(0xff121212),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: const BorderSide(width: 1, color: Color(0xffA0A0A0))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: const BorderSide(width: 1, color: Colors.white))),
    );
  }
}
