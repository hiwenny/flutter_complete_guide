import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  // runApp(StaticBaseApp());
  runApp(BaseApp());
}

// Alternatively:
// void main() => runApp(BaseApp());

class BaseApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BaseAppState();
  }
}

// State is its own class. StatefulWidget gets rebuilt - State does not, hence the separation.
// _ is how we privatise classes/properties/etc
class _BaseAppState extends State<BaseApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    // IMPORTANT
    // Without this, the internal state will still change, but doesn't re-render.
    // a.k.a doesn't run build() again.
    // Use this for changes that require rebuilds.
    setState(() {
      _questionIndex += 1;
    });
    print('This is an answer! $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {

    var questions = [
      {
        'questionText': 'Whatchu doing?',
        'answers': ['Mmmm?', 'Bluey', 'Good boy']
      },
      {
        'questionText': 'Pretty birdy?',
        'answers': ['Bluey\'s a good boy']
      },
      {
        'questionText': 'Want some seebs?',
        'answers': ['Chirp', 'Monch', 'Flies away']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful one'),
        ),
        body: Column(children: [
          Question(questions[_questionIndex]['questionText']),
          // This is because Dart doesn't support list-in-object :( so need to cast it into List<type>
          // Spread operator is as in JS
          ...(questions[_questionIndex]['answers']as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
          // RaisedButton(
          //   child: Text(questions[_questionIndex][
          //       'questionText']),
          //   onPressed: _answerQuestion,
          // ),
        ]),
      ),
    );
  }
}
