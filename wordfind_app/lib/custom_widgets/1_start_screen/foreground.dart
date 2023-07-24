import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_text.dart';
import 'package:wordfind_app/custom_widgets/1_start_screen/app_name.dart';

class StartPageForeground extends StatelessWidget {
  const StartPageForeground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // P A D D I N G
        const Padding(padding: EdgeInsets.only(top: 120)),

        // W O R D
        const AppName(),

        // G A M E
        const GradientText(text: 'Game', size: 32),

        // S I Z E D B O X
        const SizedBox(
          height: 40,
        ),

        // I C O D E G U Y
        Image.asset('assets/iCodeGuy.png'),

        // S I Z E D B O X
        const SizedBox(
          height: 94,
        ),

        const GradientText(text: 'READY?', size: 25),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
