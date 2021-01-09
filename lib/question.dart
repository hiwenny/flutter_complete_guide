import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // String questionText;
  final String
      questionText; // final tells the compiler the passed-in value is mutable,
  // but once rendered here it's immutable -- final -- so it's fine and according to Stateless uses.
  // https://news.dartlang.org/2012/06/const-static-final-oh-my.html

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
