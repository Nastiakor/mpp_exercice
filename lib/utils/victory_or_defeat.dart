import 'package:flutter/material.dart';

void didIwin(BuildContext context, finalScore) {
  print("didIwin");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min, // This makes the dialog's size to be determined by its children
          children: [
            Text(
              'Bravo ! Votre résultat est : $finalScore',
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


AlertDialog didIlose(finalScore) {
  return AlertDialog(
    content: Column(
      children: [
        Text(
          'Votre résultat est : $finalScore. Bonne chance pour la prochaine fois !',
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
}
