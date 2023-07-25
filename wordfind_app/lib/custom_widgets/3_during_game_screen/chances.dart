import 'package:flutter/material.dart';

class Chances extends StatefulWidget {
  final int chances, missed;
  const Chances(
      {super.key, required this.chances, required this.missed});

  @override
  State<Chances> createState() => _ChancesState();
}

class _ChancesState extends State<Chances> {
  // R E M A I N I N G ~ C H A N C E S ~ L I S T



  // }

  @override
  Widget build(BuildContext context) {
    List remainingChanceList = List.generate(
        widget.chances,
            (index) => Row(
          children: [
            Image.asset('assets/coloredOrange.png'),
            const SizedBox(
              width: 5,
            )
          ],
        )).toList();

    List missedList = List.generate(
        widget.missed,
            (index) => Row(
          children: [
            Image.asset('assets/nonColored.png'),
            const SizedBox(
              width: 5,
            )
          ],
        )).toList();

    List chanceStatementList = (remainingChanceList) + (missedList);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chanceStatementList.isEmpty ? [] : [...chanceStatementList],
    );
  }
}
