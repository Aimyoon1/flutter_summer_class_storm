import 'dart:math';
// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_letter.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_text.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/chances.dart';

class DuringGameScreen extends StatefulWidget {
  const DuringGameScreen({super.key});

  @override
  State<DuringGameScreen> createState() => _DuringGameScreenState();
}

class _DuringGameScreenState extends State<DuringGameScreen> {
  // P L A Y E R ~ W A N T S ~ Q U I T ~ T H E G A M E
  bool isPlayerQuit = false;

  // C H A N C E S
  int? chances = 5, missed = 0, remainingChances;

  // M I S S I O N S ~ I M A G E S
  final List missionList = [
    const AssetImage('assets/mission1.jpeg'),
    const AssetImage('assets/mission2.jpeg'),
    const AssetImage('assets/mission3.jpeg'),
  ];

  late List<String> letters;
  late List wordList;
  List<int> sequence = [];
  int testingNumber = 0;

  int whatMission = 0, score = 0;

  @override
  void initState() {
    super.initState();

    // C H A N C E S
    remainingChances = (chances! - missed!);

    wordList = List.generate(
        gameData.length,
        (index) => gameData[index]
            .wordThatPlayerHasToGuess
            .split('')
            .map((e) => 'a')
            .toList());
    letters = [
      ...gameData[whatMission].wordThatPlayerHasToGuess.split(''),
      ...List.generate(
          14 - gameData[whatMission].wordThatPlayerHasToGuess.split('').length,
          (index) => String.fromCharCode(65 + Random().nextInt(27)))
    ];
    letters.shuffle();

    if (kDebugMode) {
      print(wordList);
      print(wordList[whatMission][0]);
    }
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
                          Icons.close,
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
              Chances(
                  remainingChances: remainingChances ?? 5, missed: missed ?? 0),
              const SizedBox(
                height: 31,
              ),
              GradientText(text: '$score/${gameData.length}', size: 20),
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  wordList[whatMission][index] = 'a';
                                });
                              },
                              child: Row(
                                children: [
                                  GradientLetter(
                                      marginRight: 7,
                                      // letter: wordList.isEmpty
                                      //     ? ' '
                                      //     : wordList[whatMission].length - 1 < index
                                      //         ? ' '
                                      //         : wordList[whatMission][index],
                                      letter: wordList.isEmpty
                                          ? ' '
                                          : wordList[whatMission][index],
                                      containerHeight: 42,
                                      containerWidth: 42,
                                      containerRadius: 12,
                                      fontHeight: 38,
                                      fontsize: 24,
                                      textContainerHeight: 3 / 4,
                                      textContainerWidth: 3 / 4,
                                      textContainerRadius: 6),
                                ],
                              ),
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
                              for (int i = 0;
                                  i < wordList[whatMission].length;
                                  i++) {
                                if (wordList[whatMission][i] == 'a') {
                                  testingNumber = i;
                                  break;
                                }
                              }
                              setState(() {
                                wordList[whatMission][testingNumber] =
                                    gameData[whatMission]
                                        .wordThatPlayerHasToGuess
                                        .split('')[index]
                                        .toString()
                                        .toUpperCase();

                                if (listEquals(
                                    gameData[whatMission]
                                        .wordThatPlayerHasToGuess
                                        .toUpperCase()
                                        .split(''),
                                    wordList[whatMission])) {
                                  if (kDebugMode) {
                                    print('gg');
                                  }
                                  wordList[whatMission] = gameData[whatMission]
                                      .wordThatPlayerHasToGuess
                                      .split('')
                                      .map((e) => 'a')
                                      .toList();
                                  score++;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                GradientLetter(
                                    marginRight: 7,
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
      hint: 'Sasuke\'s lil bro',
      isPlayerDone: false,
    ),
    const GameData(
        img: AssetImage('assets/mission2.jpeg'),
        wordThatPlayerHasToGuess: 'Senku',
        hint: 'Sasuke\'s lil bro',
        isPlayerDone: false),
    const GameData(
        img: AssetImage('assets/mission3.jpeg'),
        wordThatPlayerHasToGuess: 'Chrollo',
        hint: 'Sasuke\'s lil bro',
        isPlayerDone: false),
  ];
}

class GameData {
  final AssetImage img;
  final String wordThatPlayerHasToGuess, hint;
  final bool isPlayerDone;
  // List<String> playerAnswerList;
  const GameData({
    required this.img,
    required this.wordThatPlayerHasToGuess,
    required this.hint,
    required this.isPlayerDone,
  });
}

// letters = [
//   ...gameData[whatMission].wordThatPlayerHasToGuess.split(''),
//   ...List.generate(
//       14 - gameData[whatMission].wordThatPlayerHasToGuess.split('').length,
//       (index) => String.fromCharCode(65 + Random().nextInt(27)))
// ];
// letters.shuffle();