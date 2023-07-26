import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;

  const MyTextField({super.key, required this.controller});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isShowIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Stack(
          children: [
            TextField(
                onChanged: (value) {
                  setState(() {
                    value == '' ? isShowIcon = false : isShowIcon = true;
                  });
                },
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0661, 0.761],
                              transform: GradientRotation(88.82),
                              colors: [Color(0xffe86b02), Color(0xfffa9541)])
                          .createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                controller: widget.controller,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Chiaki . . .',
                  hintStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0661, 0.761],
                                transform: GradientRotation(88.82),
                                colors: [Color(0xffe86b02), Color(0xfffa9541)])
                            .createShader(
                                const Rect.fromLTWH(0, 0, 200.0, 70.0))),
                  // suffixIcon: const Icon(
                  //   Icons.remove,
                  //   color: Colors.deepOrangeAccent,
                  // ),
                  labelText: 'Type here',
                  labelStyle: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0661, 0.761],
                                transform: GradientRotation(88.82),
                                colors: [Color(0xffe86b02), Color(0xfffa9541)])
                            .createShader(
                                const Rect.fromLTWH(0, 0, 200.0, 70.0))),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              isShowIcon
                  ? IconButton(
                      alignment: Alignment.topRight,
                      onPressed: () {
                        setState(() {
                          widget.controller.text = '';
                          isShowIcon = false;
                        });
                      },
                      icon: const Icon(Icons.delete_outlined,
                          color: Color(0xfffa9541)))
                  : const Text('')
            ])
          ],
        ));
  }
}
