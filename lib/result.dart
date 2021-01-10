import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  // Sample getter
  String get resultPhrase {
    String resultText;
    if (totalScore >= 6) {
      resultText = 'Seebs for pretty birdy';
    } else {
      resultText = 'Seebs???';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: resetHandler, child: Text('Restart?'), textColor: Colors.blue,)
        ],
      ),
    );
  }
}
