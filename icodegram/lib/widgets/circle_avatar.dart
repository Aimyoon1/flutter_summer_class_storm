import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final String userImg;
  const MyCircleAvatar({super.key, required this.userImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(userImg), fit: BoxFit.cover),
      ),
    );
  }
}
