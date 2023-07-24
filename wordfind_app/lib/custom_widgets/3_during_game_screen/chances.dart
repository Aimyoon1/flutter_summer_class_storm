import 'package:flutter/material.dart';

class Chances extends StatefulWidget {
  final int remainingChances, missed;
  const Chances(
      {super.key, required this.remainingChances, required this.missed});

  @override
  State<Chances> createState() => _ChancesState();
}

class _ChancesState extends State<Chances> {
  // R E M A I N I N G ~ C H A N C E S ~ L I S T
  late List remainingChanceList, missedList, chanceStatementList;

  @override
  void initState() {
    super.initState();

    remainingChanceList = List.generate(
        widget.remainingChances,
        (index) => Row(
              children: [
                Image.asset('assets/coloredOrange.png'),
                const SizedBox(
                  width: 5,
                )
              ],
            )).toList();

    missedList = List.generate(
        widget.missed,
        (index) => Row(
              children: [
                Image.asset('assets/nonColored.png'),
                const SizedBox(
                  width: 5,
                )
              ],
            )).toList();

    chanceStatementList = (remainingChanceList) + (missedList);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chanceStatementList.isEmpty ? [] : [...chanceStatementList],
    );
  }
}
