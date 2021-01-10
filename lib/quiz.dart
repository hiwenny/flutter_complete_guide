import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']),
      // This is because Dart doesn't support list-in-object :( so need to cast it into List<type>
      // Spread operator is as in JS
      ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
        return Answer(answerQuestion, answer);
      }).toList() // because map<T> returns an Iterable<T> instead of a List<T>

      // Above is a modularised version of
      // RaisedButton(
      //   child: Text(questions[_questionIndex][
      //       'questionText']),
      //   onPressed: _answerQuestion,
      // ),
    ]);
  }
}
