import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordfind_app/gradient_letter.dart';
import 'package:wordfind_app/gradient_text.dart';

class DuringGameScreen extends StatefulWidget {
  const DuringGameScreen({super.key});

  @override
  State<DuringGameScreen> createState() => _DuringGameScreenState();
}

class _DuringGameScreenState extends State<DuringGameScreen> {
  final List missionList = [
    const AssetImage('assets/mission1.jpeg'),
    const AssetImage('assets/mission2.jpeg'),
    const AssetImage('assets/mission3.jpeg'),
  ];
  late List<String> letters;
  late List wordList;

  int whatMission = 0, score = 0;

  @override
  void initState() {
    super.initState();
    wordList = List.generate(gameData.length, (index) => []);
    letters = [
      ...gameData[whatMission].wordThatPlayerHasToGuess.split(''),
      ...List.generate(
          14 - gameData[whatMission].wordThatPlayerHasToGuess.split('').length,
          (index) => String.fromCharCode(65 + Random().nextInt(27)))
    ];
    letters.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 32,
                    height: 32,
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
                          Icons.arrow_back,
                          size: 23,
                          color: Colors.white,
                        )),
                  ),
                  const GradientText(text: 'Aimyon', size: 24),
                  Row(
                    children: [
                      Image.asset('assets/trophy.png'),
                      const GradientText(text: '0', size: 20),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/nonColored.png'),
                      // Image.asset('assets/ColoredOrange.png')
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/nonColored.png'),
                      // Image.asset('assets/ColoredOrange.png')
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/nonColored.png'),
                      // Image.asset('assets/ColoredOrange.png')
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      Image.asset('assets/nonColored.png'),
                      // Image.asset('assets/ColoredOrange.png')
                    ],
                  ),
                  const SizedBox(width: 5),
                  Stack(
                    children: [
                      Image.asset('assets/nonColored.png'),
                      // Image.asset('assets/ColoredOrange.png')
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              GradientText(text: '$score/10', size: 20),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          whatMission == 0 ? whatMission = 0 : whatMission--;
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 265,
                    height: 265,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: const Color(0xfffa9541), width: 4),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: gameData[whatMission].img)),
                  ),
                  const SizedBox(
                    width: 10,
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
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          missionList.length - 1 != whatMission
                              ? whatMission++
                              : whatMission = missionList.length - 1;
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    gameData[whatMission]
                        .wordThatPlayerHasToGuess
                        .split('')
                        .length,
                    (index) => Row(
                          children: [
                            GradientLetter(
                                letter: wordList.isEmpty
                                    ? ' '
                                    : wordList[whatMission].length - 1 < index
                                        ? ' '
                                        : wordList[whatMission][index],
                                containerHeight: 42,
                                containerWidth: 42,
                                containerRadius: 12,
                                fontHeight: 38,
                                fontsize: 13,
                                textContainerHeight: 3 / 4,
                                textContainerWidth: 3 / 4,
                                textContainerRadius: 6),
                            SizedBox(
                              width: 7,
                            )
                          ],
                        )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/hint.png'))),
                        ),
                        const Text(
                          'Hint',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                              color: Color(0xfffa9541)
                              // foreground: Paint()
                              //   ..shader = const LinearGradient(
                              //           begin: Alignment.topLeft,
                              //           end: Alignment.bottomRight,
                              //           stops: [0.0661, 0.761],
                              //           transform: GradientRotation(88.82),
                              //           colors: [
                              //             Color(0xffe86b02),
                              //             Color(0xfffa9541)
                              //           ])
                              //       .createShader(const Rect.fromLTWH(
                              //           0.0, 0.0, 200.0, 70.0))
                              ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Container(
              color: Colors.deepPurple[100],
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(24),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        gameData[whatMission]
                            .wordThatPlayerHasToGuess
                            .split('')
                            .length,
                        (index) => GestureDetector(
                            onTap: () {
                              // bool isAddScore = listEquals(
                              //     gameData[whatMission]
                              //         .wordThatPlayerHasToGuess
                              //         .split(''),
                              //     wordList[whatMission]);
                              setState(() {
                                wordList[whatMission].add(gameData[whatMission]
                                    .wordThatPlayerHasToGuess
                                    .split('')[index]
                                    .toString());
                                if (wordList[whatMission].length ==
                                    gameData[whatMission]
                                        .wordThatPlayerHasToGuess
                                        .length) {
                                  wordList[whatMission] = [];
                                  // isAddScore ? score += 1 : score -= 1;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                GradientLetter(
                                    letter: gameData[whatMission]
                                        .wordThatPlayerHasToGuess
                                        .split('')[index]
                                        .toUpperCase(),
                                    containerHeight: 42,
                                    containerWidth: 42,
                                    containerRadius: 12,
                                    fontHeight: 38,
                                    fontsize: 26,
                                    textContainerHeight: 3 / 4,
                                    textContainerWidth: 3 / 4,
                                    textContainerRadius: 6),
                                const SizedBox(
                                  width: 7,
                                )
                              ],
                            )),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  final List<GameData> gameData = [
    const GameData(
        img: AssetImage('assets/mission1.jpeg'),
        wordThatPlayerHasToGuess: 'Itachi',
        hint: 'Sasuke\'s lil bro'),
    const GameData(
        img: AssetImage('assets/mission2.jpeg'),
        wordThatPlayerHasToGuess: 'Senku',
        hint: 'Sasuke\'s lil bro'),
    const GameData(
        img: AssetImage('assets/mission3.jpeg'),
        wordThatPlayerHasToGuess: 'Chrollo',
        hint: 'Sasuke\'s lil bro'),
  ];
}

class GameData {
  final AssetImage img;
  final String wordThatPlayerHasToGuess, hint;
  const GameData(
      {required this.img,
      required this.wordThatPlayerHasToGuess,
      required this.hint});
}

    // letters = [
    //   ...gameData[whatMission].wordThatPlayerHasToGuess.split(''),
    //   ...List.generate(
    //       14 - gameData[whatMission].wordThatPlayerHasToGuess.split('').length,
    //       (index) => String.fromCharCode(65 + Random().nextInt(27)))
    // ];
    // letters.shuffle();