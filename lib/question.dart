import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // String questionText;
  final String
      questionText; // final tells the compiler that though the passed-in value is mutable,
  // but in this instance, once rendered, it's immutable -- final -- so it's fine and according to Stateless uses.
  // https://news.dartlang.org/2012/06/const-static-final-oh-my.html

  // TLDR final is RUNTIME constant, const is compile time and runtime constant.

  Question(this.questionText); // This is the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
        // Sample styling
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
      questionText,
      style: TextStyle(
        fontSize: 28,
      ),
      textAlign: TextAlign.center,
    ));
  }
}
