import 'package:flutter/material.dart';

class DynamicBtn extends StatelessWidget {
  final String btnText;
  final double width, height;
  final Function tryAgain;
  // ignore: prefer_const_constructors_in_immutables
  const DynamicBtn(
      {super.key,
      required this.btnText,
      required this.width,
      required this.height,
      required this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tryAgain();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 16),
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
          // margin: EdgeInsets.only(bottom: marginBottom),
          child: Text(
            btnText,
            style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          )),
    );
  }
}
