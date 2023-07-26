import 'dart:math';
// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/background_img.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_letter.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_text.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/black_screen.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/chances.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/game_over.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/quit_game.dart';
// import 'package:wordfind_app/custom_widgets/3_during_game_screen/quit_game.dart';/

class DuringGameScreen extends StatefulWidget {
  final String playerName;
  const DuringGameScreen({super.key, required this.playerName});

  @override
  State<DuringGameScreen> createState() => _DuringGameScreenState();
}

class _DuringGameScreenState extends State<DuringGameScreen> {
  // D U R I N G G A M E
  bool isGameOver = false;

  // P L A Y E R ~ W A N T S ~ Q U I T ~ T H E G A M E
  bool isPlayerWannaQuit = false;

  // C H A N C E S
  int chances = 5, missed = 0;
  late bool isPlayerDone;

  // M I S S I O N  ~ I M A G E S
  final List missionList = [
    const AssetImage('assets/mission1.jpeg'),
    const AssetImage('assets/mission2.jpeg'),
    const AssetImage('assets/mission3.jpeg'),
  ];

  late List<String> letters;
  late List wordList = [
    [-1, -1, -1, -1, -1, -1],
    [-1, -1, -1, -1, -1],
    [-1, -1, -1, -1, -1, -1, -1, -1]
  ];
  late List sequence = [];
  late List randomLettersStatement = [];
  late List answerLettersWithRandomLetters;
  // late List a = [];
  int? testingNumber = -1;

  int whatMission = 0, score = 0;

  void tryAgain() {
    List newStart = List.generate(
        gameData.length,
        (int index) => List.generate(
            gameData[index].wordThatPlayerHasToGuess.length, (int idx) => -1));

    setState(() {
      wordList = newStart;
      isGameOver = false;
      missed = 0;
      score = 0;
      chances = 5;
    });
  }

  void quitGame() {
    setState(() {
      isPlayerWannaQuit = true;
    });
  }

  void backToGame() {
    setState(() {
      isGameOver = false;
      isPlayerWannaQuit = false;
    });
  }

  void wantQuitGame() {
    List newStart = List.generate(
        gameData.length,
        (int index) => List.generate(
            gameData[index].wordThatPlayerHasToGuess.length, (int idx) => -1));
    Navigator.pop(context);
    setState(() {
      wordList = newStart;
      score = 0;
      missed = 0;
      chances = 5;
      isGameOver = false;
      isPlayerWannaQuit = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print(widget.playerName);
    }
    // G A M E ~ I S ~ S T A R T E D?
    isPlayerDone = false;

    answerLettersWithRandomLetters = List.generate(
        gameData.length,
        (index) => [
              ...gameData[index].wordThatPlayerHasToGuess.split(''),
              ...List.generate(
                  14 -
                      gameData[index].wordThatPlayerHasToGuess.split('').length,
                  (index) => String.fromCharCode(65 + Random().nextInt(26)))
            ]);
    for (int i = 0; i < answerLettersWithRandomLetters.length; i++) {
      if (kDebugMode) {
        randomLettersStatement = answerLettersWithRandomLetters[i];
        randomLettersStatement.shuffle();

        sequence.add(randomLettersStatement);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackgroundImg(backgroundImg: 'assets/back2.png'),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFFE86B02),
                                      Color(0xFFFA9541)
                                    ])),
                            child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  quitGame();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 23,
                                  color: Colors.white,
                                )),
                          )),
                      GradientText(text: widget.playerName, size: 24),
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
                  Chances(chances: chances, missed: missed),
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
                                colors: [
                                  Color(0xFFE86B02),
                                  Color(0xFFFA9541)
                                ])),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              whatMission == 0
                                  ? whatMission = 0
                                  : whatMission--;
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
                                colors: [
                                  Color(0xFFE86B02),
                                  Color(0xFFFA9541)
                                ])),
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
                                      wordList[whatMission][index] = -1;
                                      // wordList[whatMission][index] = 'a';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      GradientLetter(
                                          marginRight: 7,
                                          // letter: '',
                                          letter: wordList[whatMission].isEmpty
                                              ? ''
                                              : wordList[whatMission][index] ==
                                                      -1
                                                  ? ''
                                                  : sequence[whatMission][
                                                          wordList[whatMission]
                                                              [index]]
                                                      .toUpperCase(),
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
                                  color: Color(0xfffa9541)),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                child: Container(
                    color: Colors.black.withOpacity(0.1),
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.all(24),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                          crossAxisCount: 7,
                        ),
                        itemCount: 14,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: wordList[whatMission].contains(index)
                                ? null
                                : () {
                                    if (kDebugMode) {
                                      // a[whatMission].add(index);
                                      print('a');
                                    }
                                    for (int i = 0;
                                        i < wordList[whatMission].length;
                                        i++) {
                                      if (wordList[whatMission][i] == -1) {
                                        testingNumber = i;
                                        if (wordList[whatMission].length - 1 ==
                                            i) {
                                          setState(() {
                                            isPlayerDone = true;
                                          });
                                        }
                                        break;
                                      }
                                    }

                                    setState(() {
                                      wordList[whatMission][testingNumber] =
                                          index;

                                      if (isPlayerDone) {
                                        List check = List.generate(
                                            wordList[whatMission].length,
                                            (index) => sequence[whatMission][
                                                    wordList[whatMission]
                                                        [index]]
                                                .toUpperCase());
                                        if (kDebugMode) {
                                          print(check);
                                        }
                                        if (listEquals(
                                            gameData[whatMission]
                                                .wordThatPlayerHasToGuess
                                                .toUpperCase()
                                                .split(''),
                                            check)) {
                                          whatMission++;
                                          isPlayerDone = true;
                                          score++;
                                          if (score == gameData.length) {}
                                        } else {
                                          wordList[whatMission] =
                                              gameData[whatMission]
                                                  .wordThatPlayerHasToGuess
                                                  .split('')
                                                  .map((e) => -1)
                                                  .toList();
                                          isPlayerDone = false;
                                          chances--;
                                          missed++;

                                          if (missed == 5) {
                                            isGameOver = true;
                                          }
                                        }
                                      }
                                    });
                                  },
                            child: wordList[whatMission].contains(index)
                                ? Container(
                                    width: 42,
                                    height: 42,
                                    margin: const EdgeInsets.only(
                                        right: 7, bottom: 7),
                                    decoration: BoxDecoration(
                                        color: Colors.purple[100],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  )
                                : GradientLetter(
                                    marginRight: 7,
                                    letter: sequence[whatMission][index]
                                        .toUpperCase(),
                                    containerHeight: 42,
                                    containerWidth: 42,
                                    containerRadius: 12,
                                    fontHeight: 38,
                                    fontsize: 26,
                                    textContainerHeight: 3 / 4,
                                    textContainerWidth: 3 / 4,
                                    textContainerRadius: 6),
                          );
                        })),
              )
            ],
          ),
        ),
        isGameOver || isPlayerWannaQuit ? const BlackScreen() : Container(),
        isGameOver ? GameOver(tryAgain: tryAgain) : Container(),
        // isPlayerWannaQuit ? const BlackScreen() : Container(),
        isPlayerWannaQuit
            ? QuitGame(backToGame: backToGame, wantQuitGame: wantQuitGame)
            : Container()
        // QuitGame()
      ],
    ));
  }

  final List<GameData> gameData = [
    const GameData(
        img: AssetImage('assets/mission1.jpeg'),
        wordThatPlayerHasToGuess: 'Itachi',
        hint: 'Sasuke\'s lil bro',
        isPlayerDone: false,
        question: 'Who is he?'),
    const GameData(
        img: AssetImage('assets/mission2.jpeg'),
        wordThatPlayerHasToGuess: 'Senku',
        hint: 'Sasuke\'s lil bro',
        isPlayerDone: false,
        question: 'Who is he?'),
    const GameData(
        img: AssetImage('assets/mission3.jpeg'),
        wordThatPlayerHasToGuess: 'Chrollo',
        hint: 'Sasuke\'s lil bro',
        isPlayerDone: false,
        question: 'Who is he?'),
  ];
}

class GameData {
  final AssetImage img;
  final String wordThatPlayerHasToGuess, hint, question;
  final bool isPlayerDone;
  // List<String> playerAnswerList;
  const GameData(
      {required this.img,
      required this.wordThatPlayerHasToGuess,
      required this.hint,
      required this.isPlayerDone,
      required this.question});
}

class LetterStatement {
  final String letter;
  final bool isClicked;
  const LetterStatement({required this.isClicked, required this.letter});
}
