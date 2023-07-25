import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  final BuildContext whatContext;
  const BackBtn({super.key, required this.whatContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 32,
      height: 32,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
      child: Center(
        child: IconButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            weight: 400,
          ),
        ),
      ),
    );
  }
}
