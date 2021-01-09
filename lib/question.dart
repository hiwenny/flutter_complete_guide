import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText); // This is the constructor

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}