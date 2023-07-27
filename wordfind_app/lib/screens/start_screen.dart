import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/background_img.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/floating_action_btn.dart';
import 'package:wordfind_app/custom_widgets/1_start_screen/foreground.dart';
import 'package:wordfind_app/screens/player_name_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Stack(
        children: [
          BackgroundImg(backgroundImg: 'assets/back1.png'),
          StartPageForeground()
        ],
      ),
      floatingActionButton: MyFloatingActionButton(
        marginBottom: 111,
        btnName: 'PLAY',
        navigateWidget: const PlayerNameScreen(),
        startPageContext: context,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
