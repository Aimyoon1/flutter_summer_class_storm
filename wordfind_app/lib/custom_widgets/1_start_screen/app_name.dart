// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wordfind_app/custom_widgets/0_widgets_uses_on_all_screens/gradient_letter.dart';

// import 'gradient_letter.dart';

class AppName extends StatefulWidget {
  const AppName({super.key});

  @override
  State<AppName> createState() => _AppNameState();
}

class _AppNameState extends State<AppName> {
  final List<String> appName = ['W', 'O', 'R', 'D'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: appName
          .map(
            (item) => GradientLetter(
              marginRight: 7,
              letter: item,
              containerHeight: 60.0,
              containerWidth: 60.0,
              textContainerHeight: 2 / 3,
              textContainerWidth: 2 / 3,
              fontsize: 32,
              fontHeight: 38,
              containerRadius: 16,
              textContainerRadius: 8,
            ),
          )
          .toList(),
    );
  }
}
