import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/background_img.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/floating_action_btn.dart';
// import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_letter.dart';
import 'package:wordfind_app/custom_widgets/2_player_name_screen/app_name.dart';
import 'package:wordfind_app/custom_widgets/2_player_name_screen/back_btn.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/my_text_filed.dart';
import 'package:wordfind_app/custom_widgets/3_during_game_screen/during_game_screen.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_text.dart';

class PlayerNameScreen extends StatefulWidget {
  const PlayerNameScreen({
    super.key,
  });

  @override
  State<PlayerNameScreen> createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  TextEditingController playerNameFieldController = TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
// B A C K G R O U N D I M A G E
            const BackgroundImg(backgroundImg: 'assets/back2.png'),

// B A C K B U T T O N
            BackBtn(whatContext: context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
// A P P N A M E
                        PlayerNameScreenAppName(),

// G A M E
                        GradientText(text: 'Game', size: 28)
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),

// I C O D E G U Y
                Image.asset('assets/iCodeGuyHead.png'),

                const SizedBox(
                  height: 30,
                ),

// P L A Y E R N A M E
                const GradientText(text: 'Player Name', size: 20),
                const SizedBox(
                  height: 8,
                ),

// M Y T E X T F I E L D
                MyTextField(
                  controller: playerNameFieldController,
                ),
              ],
            )
          ],
        ),
      ),

// F L O A T I N G A C T I O N B U T T O N
      floatingActionButton: MyFloatingActionButton(
          startPageContext: context,
          navigateWidget: DuringGameScreen(
            playerName: playerNameFieldController.text.toString(),
          ),
          btnName: 'Start',
          marginBottom: 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
