// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_letter.dart';

// import 'gradient_letter.dart';

class PlayerNameScreenAppName extends StatefulWidget {
  const PlayerNameScreenAppName({super.key});

  @override
  State<PlayerNameScreenAppName> createState() =>
      _PlayerNameScreenAppNameState();
}

class _PlayerNameScreenAppNameState extends State<PlayerNameScreenAppName> {
  final List<String> playerNameScreenappName = ['W', 'O', 'R', 'D'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: playerNameScreenappName
          .map(
            (item) => GradientLetter(
              marginRight: 4,
              letter: item,
              containerHeight: 32.0,
              containerWidth: 32.0,
              textContainerHeight: 2 / 3,
              textContainerWidth: 2 / 3,
              fontsize: 16,
              fontHeight: 48,
              containerRadius: 32 / 3,
              textContainerRadius: 4,
            ),
          )
          .toList(),
    );
  }
}
