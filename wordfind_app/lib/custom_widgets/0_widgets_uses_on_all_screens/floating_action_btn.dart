import 'package:flutter/material.dart';
// import 'package:wordfind_app/custom_widgets/2_player_name_screen/player_name_screen.dart';

class MyFloatingActionButton extends StatelessWidget {
  final BuildContext startPageContext;
  final Widget navigateWidget;
  final String btnName;
  final double marginBottom;

  const MyFloatingActionButton(
      {super.key,
      required this.startPageContext,
      required this.navigateWidget,
      required this.btnName,
      required this.marginBottom});

  // function ~ navigate register screen
  void toPlayerNameScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => navigateWidget));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFE86B02), Color(0xFFFA9541)])),
      margin: EdgeInsets.only(bottom: marginBottom),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          toPlayerNameScreen(startPageContext);
        },
        child: ElevatedButton(
          onPressed: () {
            toPlayerNameScreen(startPageContext);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: Text(
            btnName,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
