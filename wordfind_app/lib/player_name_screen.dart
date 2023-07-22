import 'package:flutter/material.dart';
import 'package:wordfind_app/Gradient_letter.dart';
import 'package:wordfind_app/duringGameScreen.dart';
import 'package:wordfind_app/gradient_text.dart';

class PlayerNameScreen extends StatefulWidget {
  const PlayerNameScreen({super.key});

  @override
  State<PlayerNameScreen> createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final TextEditingController playerNameFieldController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon : Icon(Icons.arrow_back,                     color: Colors.white,
                      weight: 400,),

                  ),
                ),
              ),
            ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Row(
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
                SizedBox(
                  height: 110,
                ),
                Image.asset('assets/iCodeGuyHead.png'),
                SizedBox(
                  height: 30,
                ),
                GradientText(text: 'Player Name', size: 20),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 310,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                      controller: playerNameFieldController,

                      decoration: InputDecoration(
                        hintText: 'Aimyon...',
                        hintStyle: TextStyle( fontFamily: 'Nunito',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0661, 0.761],
                                  transform: GradientRotation(88.82),
                                  colors: [
                                    Color(0xffe86b02),
                                    Color(0xfffa9541)
                                  ])
                                  .createShader(
                                  const Rect.fromLTWH(0, 0, 200.0, 70.0))),
                        suffixIcon: Icon(Icons.remove, color: Colors.deepOrangeAccent,),
                        border: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Type here',
                        labelStyle: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0661, 0.761],
                                  transform: GradientRotation(88.82),
                                  colors: [
                                    Color(0xffe86b02),
                                    Color(0xfffa9541)
                                  ])
                                  .createShader(
                                  const Rect.fromLTWH(0, 0, 200.0, 70.0))),
                      )),
                ),
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
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
        child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const DuringGameScreen()));
            },
            elevation: 0,
            child: Text('Start', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, fontFamily: 'Nunito'),)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
