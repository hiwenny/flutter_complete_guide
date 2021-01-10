import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText); // constructor. 

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue, // static property of class Colors. Kinda like an enum.
        child: Text(
          answerText,
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
