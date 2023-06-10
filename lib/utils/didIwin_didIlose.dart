import 'package:flutter/material.dart';

void didIwin(BuildContext context, finalScore) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          // This makes the dialog's size to be determined by its children
          children: [
            Text(
              'Bravo ! Ton résultat est : $finalScore',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF30CE9B),
              ),
            ),
            Image.asset('images/rabbit_dribble.gif'),
          ],
        ),
      );
    },
  );
}

void didIlose(BuildContext context, finalScore) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ton résultat est : $finalScore. Bonne chance pour la prochaine fois !',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFA29D),
              ),
            ),
            Image.asset('images/Secret Life Of Pets Snowball Cute Rabbit.gif'),
          ],
        ),
      );
    },
  );
}

