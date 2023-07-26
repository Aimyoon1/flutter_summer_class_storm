import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_text.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/dynamic_btn.dart';

class QuitGame extends StatefulWidget {
  final Function wantQuitGame, backToGame;
  const QuitGame(
      {super.key, required this.wantQuitGame, required this.backToGame});

  @override
  State<QuitGame> createState() => _QuitGameState();
}

class _QuitGameState extends State<QuitGame> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
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
                            widget.backToGame();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/coloredOrange.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const GradientText(
                            text: 'ARE YOU SURE TO QUIT', size: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DynamicBtn(
                              tryAgain: () {
                                widget.wantQuitGame();
                              },
                              width: 134,
                              height: 45,
                              btnText: 'Yes',
                            ),
                            DynamicBtn(
                              tryAgain: () {
                                widget.backToGame();
                              },
                              width: 134,
                              height: 45,
                              btnText: 'No',
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
