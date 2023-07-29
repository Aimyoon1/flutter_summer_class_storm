import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  const MyTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Color(0xffA0A0A0), fontSize: 15),
          filled: true,
          fillColor: Color(0xff121212),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffA0A0A0))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)
          )
      ),
    );
  }
}
