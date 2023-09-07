import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var activeImage = 'assets/images/dice-1.png';
  var currentDiceRoll = 1;

  void rollDice() async {
    for (int i = 0; i < 15; i++) {
      setState(() {
        currentDiceRoll = Random().nextInt(6) + 1;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      print(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Image.asset(
            'assets/images/dice-$currentDiceRoll.png',
            width: 200,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 26,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
