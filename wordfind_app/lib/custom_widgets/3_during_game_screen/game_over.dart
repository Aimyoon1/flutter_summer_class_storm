import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_text.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/dynamic_btn.dart';

class AfterGame extends StatefulWidget {
  final Function tryAgain;
  final String btnText;
  const AfterGame({super.key, required this.tryAgain, required this.btnText});

  @override
  State<AfterGame> createState() => _AfterGameState();
}

class _AfterGameState extends State<AfterGame> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: Container(
        width: 332,
        height: 231,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 32,
                    height: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              Column(
                children: [
                  const GradientText(text: 'Winner!', size: 26),
                  DynamicBtn(
                    tryAgain: widget.tryAgain,
                    width: 292,
                    height: 60,
                    btnText: widget.btnText,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
