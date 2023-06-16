import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color? answerColor;
  final VoidCallback? answerTap;

  const Answer({
    required this.answerText,
    this.answerColor,
    this.answerTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(
            color: Color(0xFF30CE9B),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
