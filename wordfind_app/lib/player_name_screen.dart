import 'package:flutter/material.dart';
import 'package:wordfind_app/gradient_letter.dart';
import 'package:wordfind_app/during_game_screen.dart';
import 'package:wordfind_app/gradient_text.dart';

class PlayerNameScreen extends StatefulWidget {
  const PlayerNameScreen({super.key});

  @override
  State<PlayerNameScreen> createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final TextEditingController playerNameFieldController =
      TextEditingController();

  bool isShowIcon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
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
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            GradientLetter(
                              letter: 'W',
                              containerHeight: 32.0,
                              containerWidth: 32.0,
                              textContainerHeight: 2 / 3,
                              textContainerWidth: 2 / 3,
                              fontsize: 16,
                              fontHeight: 48,
                              containerRadius: 32 / 3,
                              textContainerRadius: 4,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GradientLetter(
                              letter: 'O',
                              containerHeight: 32.0,
                              containerWidth: 32.0,
                              textContainerHeight: 2 / 3,
                              textContainerWidth: 2 / 3,
                              fontsize: 16,
                              fontHeight: 48,
                              containerRadius: 32 / 3,
                              textContainerRadius: 4,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GradientLetter(
                              letter: 'R',
                              containerHeight: 32.0,
                              containerWidth: 32.0,
                              textContainerHeight: 2 / 3,
                              textContainerWidth: 2 / 3,
                              fontsize: 16,
                              fontHeight: 48,
                              containerRadius: 32 / 3,
                              textContainerRadius: 4,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GradientLetter(
                              letter: 'D',
                              containerHeight: 32.0,
                              containerWidth: 32.0,
                              textContainerHeight: 2 / 3,
                              textContainerWidth: 2 / 3,
                              fontsize: 16,
                              fontHeight: 48,
                              containerRadius: 32 / 3,
                              textContainerRadius: 4,
                            ),
                          ],
                        ),
                        GradientText(text: 'Game', size: 28)
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
                Image.asset('assets/iCodeGuyHead.png'),
                const SizedBox(
                  height: 30,
                ),
                const GradientText(text: 'Player Name', size: 20),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Stack(
                      children: [
                        TextField(
                            onChanged: (value) {
                              setState(() {
                                value == ''
                                    ? isShowIcon = false
                                    : isShowIcon = true;
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
                                          colors: [
                                            Color(0xffe86b02),
                                            Color(0xfffa9541)
                                          ])
                                      .createShader(const Rect.fromLTWH(
                                          0.0, 0.0, 200.0, 70.0))),
                            controller: playerNameFieldController,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                                            colors: [
                                              Color(0xffe86b02),
                                              Color(0xfffa9541)
                                            ])
                                        .createShader(const Rect.fromLTWH(
                                            0, 0, 200.0, 70.0))),
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
                                            colors: [
                                              Color(0xffe86b02),
                                              Color(0xfffa9541)
                                            ])
                                        .createShader(const Rect.fromLTWH(
                                            0, 0, 200.0, 70.0))),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              isShowIcon
                                  ? IconButton(
                                      alignment: Alignment.topRight,
                                      onPressed: () {
                                        setState(() {
                                          playerNameFieldController.text = '';
                                          isShowIcon = false;
                                        });
                                      },
                                      icon: const Icon(Icons.delete_outlined,
                                          color: Color(0xfffa9541)))
                                  : const Text('')
                            ])
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        // margin: EdgeInsets.only(bottom: 10),
        width: 310,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
        child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DuringGameScreen()));
            },
            elevation: 0,
            child: const Text(
              'Start',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  fontFamily: 'Nunito'),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
