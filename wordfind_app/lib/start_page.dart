import 'package:flutter/material.dart';
import 'package:wordfind_app/gradient_letter.dart';
import 'package:wordfind_app/gradient_text.dart';
import 'package:wordfind_app/player_name_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void toPlayerNameScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PlayerNameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back1.png'), fit: BoxFit.cover),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 120)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientLetter(
                    letter: 'W',
                    containerHeight: 60.0,
                    containerWidth: 60.0,
                    textContainerHeight: 2 / 3,
                    textContainerWidth: 2 / 3,
                    fontsize: 32,
                    fontHeight: 38,
                    containerRadius: 16,
                    textContainerRadius: 8,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GradientLetter(
                    letter: 'O',
                    containerHeight: 60.0,
                    containerWidth: 60.0,
                    textContainerHeight: 2 / 3,
                    textContainerWidth: 2 / 3,
                    fontsize: 32,
                    fontHeight: 38,
                    containerRadius: 16,
                    textContainerRadius: 8,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GradientLetter(
                    letter: 'R',
                    containerHeight: 60.0,
                    containerWidth: 60.0,
                    textContainerHeight: 2 / 3,
                    textContainerWidth: 2 / 3,
                    fontsize: 32,
                    fontHeight: 38,
                    containerRadius: 16,
                    textContainerRadius: 8,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GradientLetter(
                    letter: 'D',
                    containerHeight: 60.0,
                    containerWidth: 60.0,
                    textContainerHeight: 2 / 3,
                    textContainerWidth: 2 / 3,
                    fontsize: 32,
                    fontHeight: 38,
                    containerRadius: 16,
                    textContainerRadius: 8,
                  ),
                ],
              ),
              const GradientText(text: 'Game', size: 32),
              const SizedBox(
                height: 40,
              ),
              Image.asset('assets/iCodeGuy.png'),
              const SizedBox(
                height: 94,
              ),
              const GradientText(text: 'READY?', size: 25),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 310,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
        margin: const EdgeInsets.only(bottom: 111),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            toPlayerNameScreen(context);
          },
          child: ElevatedButton(
            onPressed: () {
              toPlayerNameScreen(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
            ),
            child: const Text(
              'PLAY',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
